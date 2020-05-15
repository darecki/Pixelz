//
//  GameView.swift
//  Pixelz
//
//  Created by Dariusz Ciesla on 15/05/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import SwiftUI

struct GameView: View {
    let board: Board
    
    var body: some View {
        VStack {
            Text("The board is here")
            BoardView(board: board)
            .padding()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(board: Board.random)
    }
}
