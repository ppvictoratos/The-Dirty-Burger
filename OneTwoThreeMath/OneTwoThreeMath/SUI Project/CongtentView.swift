//
//  ContentView.swift
//  SUIOneTwoThree
//
//  Created by Peter Victoratos on 6/17/20.
//  Copyright © 2020 loveshakk. All rights reserved.
//

import SwiftUI

struct CongentView: View {
    var body: some View {
        MainMenu(gameModeRef: gameMode.addition)
    }
}

struct CongentView_Previews: PreviewProvider {
    static var previews: some View {
        CongentView()
    }
}
