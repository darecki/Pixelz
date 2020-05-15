//
//  BoardView.swift
//  Pixelz
//
//  Created by Dariusz Ciesla on 15/05/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import SwiftUI

struct BoardView: View {
    let board: Board

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ForEach(0..<self.board.rows, id: \.self) { row in
                HStack(alignment: .center, spacing: 0) {
                    ForEach(0..<self.board.columns, id: \.self) { column in
                        return TileView(tile: Tile(value: self.board[row, column]))
                    }
                }
            }
        }
        .border(Color.primary, width: 5)
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(board: Board.random)
    }
}
