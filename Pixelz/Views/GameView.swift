//
//  GameView.swift
//  Pixelz
//
//  Created by Dariusz Ciesla on 15/05/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import SwiftUI

struct GameView: View {
    @State var board: Board

    var body: some View {
        VStack {
            StatsView()
                .padding()
            BoardView(board: board)
                .padding(.bottom)
            ControlView(tileTapped: didTapTile)
        }
        .padding()
    }

    func didTapTile(_ color: Int) {
        board.makeMove(color)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(board: Board.random)
    }
}
