//
//  ContentView.swift
//  Pixelz
//
//  Created by Dariusz Ciesla on 15/05/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, World!")
                NavigationLink(destination: GameView(board: Board.random)) {
                    Text("New Game")
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
