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
    
    let difficultyStates: [T]
    let locationStates: [S]
    @State var currentIndex = 0
    @Binding var selectedState: T
    @State var currentLocation = 0
    @Binding var userLocation: S
    
    var body: some View {
        Spacer()
        Button {
            if currentIndex == 1 {
                currentLocation = 1
            }
            else if currentIndex == 2 | 3 | 4 {
                currentLocation = 2
                currentIndex = currentIndex - 1
            }
            else if currentIndex == 5 {
                currentLocation = 3
                currentIndex = currentIndex - 1
            }
            selectedState = difficultyStates[currentIndex]
            userLocation = locationStates[currentLocation]
        } label: {
            if currentLocation == 1 {
                Image(systemName: "gamecontroller.fill")
                    .foregroundColor(.white)
            }
            else if currentLocation == 2 | 3 {
                Text("<-")
                    .font(chalk)
                    .foregroundColor(.white)
            }
        }
        Spacer()
    }
}

struct forth<T: difficultyState, S: locationState>: View {
    
    let states: [T]
    @State var currentIndex = 0
    @Binding var selectedState: T
    @Binding var userLocation: S
    @State var endOfTheLine = 3
    
    var body: some View {
        Spacer()
        Button {
            if currentIndex == 1 {
                endOfTheLine = 1
                currentIndex = currentIndex + 1
            }
            else if currentIndex == 5 {
                endOfTheLine = 5
            }
            else if currentIndex == 2 | 3 | 4 {
                endOfTheLine = 3
                currentIndex = currentIndex + 1
                endOfTheLine = 1
            }
            selectedState = states[currentIndex]
        } label: {
            switch endOfTheLine {
            case 0:
                Text("->")
                    .font(chalk)
                    .foregroundColor(.white)
            case 1:
                Text("->")
                    .font(chalk)
                    .foregroundColor(.white)
            case 2:
                Image(systemName: "person.fill")
                    .foregroundColor(.white)
            default:
                Text("->")
                    .font(chalk)
                    .foregroundColor(.white)
            }
        }
        Spacer()
    }
}

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
                        back(difficultyStates: gameDifficulty.allCases,
                             locationStates: gameLocation.allCases,
                             selectedState: $difficultySelection,
                             userLocation: $shouldButtonsChange)
                        
                        forth(states: gameDifficulty.allCases,
                              selectedState: $difficultySelection,
                              userLocation: $shouldButtonsChange)
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
