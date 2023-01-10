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

struct HomeView: View {
    @State var operatorSelection: mathOperator
    
    var body: some View {
        NavigationView {
            ZStack {
                //background image
                Image("green").resizable().edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("OneTwoThree")
                        .font(Font.custom("Chalkduster", size: 45)).bold()
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 30)
                    
                    mathOperatorSelectors()
                    
                    Spacer(minLength: 15)
                    
                    
                    
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
        HomeView(operatorSelection: .addition)
    }
}
