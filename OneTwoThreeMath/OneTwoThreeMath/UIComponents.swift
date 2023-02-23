//
//  UIComponents.swift
//  OneTwoThreeMath
//
//  Created by Petie Positivo on 1/9/23.
//

import Foundation
import AVFoundation
import SwiftUI

//Giving things short names so it looks nicer (in code) when we use them
let chalk = Font.custom("Chalkduster", size: 45)
let chalkSmall = Font.custom("Chalkduster", size: 15)

var soundEffectPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            soundEffectPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            soundEffectPlayer?.play()
        } catch {
            print("Could not find the sound file")
        }
    }
}

//This is what appears when user taps & drags
struct Line {
    var points: [CGPoint]
    var color: Color
    var lineWidth:CGFloat
}

struct mathOperatorSelectors: View {
    @State private var selectedOperatorIndex: Int = 0
    private var operatorOptions = ["+", "-", "x", "÷"]

    
    var body: some View {
        
        Picker("Operator", selection: $selectedOperatorIndex) {
            ForEach(0..<operatorOptions.count) {
                Text(self.operatorOptions[$0])
            }
        }.pickerStyle(.segmented)
        
    }
}

struct difficultySelector: View {
    @State private var selectedDifficultyIndex: Int = 0
    private var difficultyOptions = ["😌 Easy", "😐 Medium", "😓 Hard"]
    
    var body: some View {
        
        Picker("Difficulty", selection: $selectedDifficultyIndex) {
            ForEach(0..<difficultyOptions.count) {
                Text(self.difficultyOptions[$0])
            }
        }.pickerStyle(.segmented)
    }
}

struct dragInputView: View {
    @State var points = [Line]()
    
    var body: some View {
        
        ZStack {
            Image("green")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            Canvas { context, size in
                for line in points {
                    var path = Path()
                    path.addLines(line.points)
                    
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }
                
            }
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
                        let newPoint = value.location
                        if value.translation.width + value.translation.height == 0 {
                            points.append(Line(points: [newPoint], color: Color.white, lineWidth: 7))
                    } else {
                        let index = points.count - 1
                        points[index].points.append(newPoint)
                    }
                }))
            }
        }
}

struct Randers: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.yellow : Color.white)
    }
}

struct UIComponents_Previews: PreviewProvider {
    
    static var previews: some View {
        ZStack {
            
            Image("green")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                    }
        
        difficultySelector()
            .foregroundColor(.green)
    }
}

