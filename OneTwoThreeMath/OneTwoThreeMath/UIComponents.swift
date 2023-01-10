//
//  UIComponents.swift
//  OneTwoThreeMath
//
//  Created by Petie Positivo on 1/9/23.
//

import Foundation
import SwiftUI

//Giving things short names so it looks nicer (in code) when we use them
let chalk = Font.custom("Chalkduster", size: 45)

//This is what appears when user taps & drags
struct Line {
    var points: [CGPoint]
    var color: Color
    var lineWidth:CGFloat
}

struct mathOperatorSelectors: View {
    enum operators {
        case add
        case sub
        case mux //"multiply"?
        case div
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Button(action: { print("add")} ) {
                    Text("+")
                        .font(chalk)
                        .accentColor(.white)
                }
                Spacer()
                Button(action: { print("sub")} ) {
                    Text("-")
                        .font(chalk)
                        .accentColor(.white)
                }
                Spacer()

                Button(action: { print("mult")} ) {
                    Text("x")
                        .font(chalk)
                        .accentColor(.white)
                }
                Spacer()
                Button(action: { print("div")}) {
                    Text("÷")
                        .font(chalk)
                        .accentColor(.white)
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct back: View {

    var body: some View {
        Spacer()
        Button {
            print("Go down in difficulty")
        } label: {
            Text("<-")
                .font(chalk)
                .foregroundColor(.white)
        }
        Spacer()
    }
}
//&
struct forth: View {

    var body: some View {
        Spacer()
        Button {
            print("Go up in difficulty")
        } label: {
            Text("->")
                .font(chalk)
                .foregroundColor(.white)
        }
        Spacer()
    }
}

struct writeAnswerHere: View {
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

struct UIComponents_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Image("green")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer(minLength: 90)
                HStack {
                    back()
                    Spacer()
                    forth()
                }
                mathOperatorSelectors()
                writeAnswerHere()
                    .colorMultiply(.orange)
                    .shadow(color: .black, radius: 10, x: 0, y: 0)
                Spacer(minLength: 90)
            }
        }
    }
}
