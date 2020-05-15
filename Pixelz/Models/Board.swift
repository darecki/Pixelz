//
//  Board.swift
//  Pixelz
//
//  Created by Dariusz Ciesla on 15/05/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import Foundation

enum BoardCreationError: Error {
    case notEqualNumberOfColumns
}

struct Board {
    let rows: Int
    let columns: Int

    private(set) var matrix: [[Int?]]

    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.matrix = [[Int?]](repeating: [Int?](repeating: nil, count: columns), count: rows)
    }

    init(matrix: [[Int]]) throws {
        let columnsPerRow = matrix.map { $0.count }
        guard Set(columnsPerRow).count == 1 else {
            throw BoardCreationError.notEqualNumberOfColumns
        }
        self.rows = columnsPerRow.count
        self.columns = columnsPerRow.first!
        self.matrix = matrix
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

    @discardableResult
    mutating func makeMove(_ color: Int) -> Bool {
        guard let currentColor = self[0, 0], currentColor != color else { return false }
        paintNeighbours(0, 0, from: currentColor, to: color)
        return true
    }

    private mutating func paintNeighbours(_ row: Int, _ column: Int, from oldColor: Int, to newColor: Int) {
        guard
            let color = self[row, column],
            color != newColor,
            color == oldColor
            else {
                return
        }

        self[row, column] = newColor
        paintNeighbours(row, column - 1, from: oldColor, to: newColor)
        paintNeighbours(row - 1, column, from: oldColor, to: newColor)
        paintNeighbours(row, column + 1, from: oldColor, to: newColor)
        paintNeighbours(row + 1, column, from: oldColor, to: newColor)
    }

    var isComplete: Bool {
        Set(matrix.flatMap { $0 }).count == 1
    }
}

extension Board {
    static var random: Board {
        var board = Board(rows: 6, columns: 4)
        board.shuffle()
        return board
    }
}
