//
//  HomeView.swift
//  OneTwoThreeMath
//
//  This is where users will land upon app start. They can either view their profile, settings, or select a game mode and start.
//
//  Created by Petie Positivo on 1/9/23.
//

import SwiftUI

enum mathOperator {
    case addition
    case subtraction
    case multiplication
    case divison
}

//MARK: Location Helpers
protocol locationState: CaseIterable {
    var title: String { get }
}

extension locationState where Self: RawRepresentable, RawValue == String {
    var title: String {
        self.rawValue
    }
}

enum gameLocation: String, locationState {
    case left = "too Low"
    case mid = "not Today"
    case right = "too High"
}

//MARK: Difficulty Helpers
protocol difficultyState: CaseIterable {
    var title: String { get }
}

extension difficultyState where Self: RawRepresentable, RawValue == String {
    var title: String {
        self.rawValue
    }
}

enum gameDifficulty: String, difficultyState {
    case gameInfo = "Game Info"
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    case playerStats = "Player Stats"
}

struct back<T: difficultyState, S: locationState>: View {
    
    let difficulties: [T]
    let locations: [S]
    @State var difficultyID = 0
    @Binding var selectedDifficulty: T
    @State var locationID = 0
    @Binding var selectedLocation: S
    
    var body: some View {
        Spacer()
        //
        Button {
            if difficultyID == 0 {
                locationID = 1
            }
            else if difficultyID == 2 | 3 | 4 {
                locationID = 2
                difficultyID = difficultyID - 1
            }
            else if difficultyID == 5 {
                locationID = 3
                difficultyID = difficultyID - 1
            }
            selectedDifficulty = difficulties[difficultyID]
            selectedLocation = locations[locationID]
        } label: {
            if locationID == 1 {
                Image(systemName: "gamecontroller.fill")
                    .foregroundColor(.white)
            }
            else if locationID != 1 {
                Text("<-")
                    .font(chalk)
                    .foregroundColor(.white)
            }
        }
        Spacer()
    }
}

//struct forth<T: difficultyState, S: locationState>: View {
    
//    let states: [T]
//    @State var difficultyID = 0
//    @Binding var selectedDifficulty: T
//    @Binding var selectedLocation: S
//    @State var endOfTheLine = 3
//
//    var body: some View {
//        Spacer()
//        Button {
//            if difficultyID == 1 {
//                endOfTheLine = 1
//                difficultyID = difficultyID + 1
//            }
//            else if difficultyID == 5 {
//                endOfTheLine = 5
//            }
//            else if difficultyID == 2 | 3 | 4 {
//                endOfTheLine = 3
//                difficultyID = difficultyID + 1
//                endOfTheLine = 1
//            }
//            selectedDifficulty = states[difficultyID]
//        } label: {
//            switch endOfTheLine {
//            case 0:
//                Text("->")
//                    .font(chalk)
//                    .foregroundColor(.white)
//            case 1:
//                Text("->")
//                    .font(chalk)
//                    .foregroundColor(.white)
//            case 2:
//                Image(systemName: "person.fill")
//                    .foregroundColor(.white)
//            default:
//                Text("->")
//                    .font(chalk)
//                    .foregroundColor(.white)
//            }
//        }
//        Spacer()
//    }
//}

//add switch statement to change image color w color multiplier
func setGameColor(difficulty: gameDifficulty) -> Color {
    switch difficulty {
    case .easy:
        return .green
    case .medium:
        return .yellow
    case .hard:
        return .red
    case .gameInfo:
        return .green
    case .playerStats:
        return .red
    }
}

struct HomeView: View {
    @State var operatorSelection: mathOperator
    @State var difficultySelection: gameDifficulty
    @State var shouldButtonsChange: gameLocation
    
    //in order for this to default we may need to store the diffulty locally?
    //@State var beyondDifficultyExtremity: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                //background image
                Image("green")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .colorMultiply(setGameColor(difficulty: difficultySelection))
                
                VStack {
                    Text("OneTwoThree")
                        .font(Font.custom("Chalkduster", size: 45)).bold()
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 30)
                    
                    mathOperatorSelectors()
                    
                    Spacer(minLength: 15)
                    
                    HStack {
                        back(difficulties: gameDifficulty.allCases,
                             locations: gameLocation.allCases,
                             selectedDifficulty: $difficultySelection,
                             selectedLocation: $shouldButtonsChange)
                        
//                        forth(states: gameDifficulty.allCases,
//                              selectedDifficulty: $difficultySelection,
//                              selectedLocation: $shouldButtonsChange)
                    }
                    
                    Spacer(minLength: 15)
                    
                    NavigationLink(destination:
                                    PlayView(gameModeRef: self.operatorSelection)) { Text("Go")
                            .font(Font.custom("Chalkduster", size: 45))
                            .accentColor(.white)
                    
                }

                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(operatorSelection: .addition,
                 difficultySelection: .medium,
                 shouldButtonsChange: .mid)
    }
}
