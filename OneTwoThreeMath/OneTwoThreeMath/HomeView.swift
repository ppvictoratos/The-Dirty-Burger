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

enum gameDifficulty {
    case easy
    case medium
    case hard
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
    }
}

struct HomeView: View {
    @State var operatorSelection: mathOperator
    @State var difficultySelection: gameDifficulty
    
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
                        back()
                        forth()
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
                 difficultySelection: .easy)
    }
}
