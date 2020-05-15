//
//  Board.swift
//  Pixelz
//
//  Created by Dariusz Ciesla on 15/05/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import Foundation

struct Board {
    let rows: Int
    let columns: Int

    private var matrix: [[Int?]]

    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.matrix = [[Int?]](repeating: [Int?](repeating: nil, count: columns), count: rows)
    }

    subscript(row: Int, column: Int) -> Int? {
        get {
            guard column >= 0 && column < columns && row >= 0 && row < rows else { return nil }
            return matrix[row][column]
        }

        set {
            guard column < columns && row < rows else { return }
            matrix[row][column] = newValue
        }
    }

    mutating func shuffle() {
        for row in 0 ..< rows {
            for column in 0 ..< columns {
                self[row, column] = Int(arc4random_uniform(5))
            }
        }
    }
}

extension Board {
    static var random: Board {
        var board = Board(rows: 6, columns: 4)
        board.shuffle()
        return board
    }
}
