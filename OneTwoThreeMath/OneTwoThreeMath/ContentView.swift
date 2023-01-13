//
//  ContentView.swift
//  OneTwoThreeMath
//
//  Created by Petie Positivo on 1/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView(operatorSelection: .addition,
                 difficultySelection: .medium,
                 shouldButtonsChange: .mid)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
