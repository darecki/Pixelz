//
//  BoardTests.swift
//  PixelzTests
//
//  Created by Dariusz Ciesla on 15/05/2020.
//  Copyright © 2020 Darek Ciesla. All rights reserved.
//

import XCTest
@testable import Pixelz

class BoardTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func test_board_creates_as_nilled() {
        let board = Board(rows: 3, columns: 3)

        XCTAssertNil(board[0, 0])
        XCTAssertNil(board[1, 0])
        XCTAssertNil(board[2, 0])
        XCTAssertNil(board[0, 1])
        XCTAssertNil(board[0, 2])
    }

    func test_board_accessing_out_of_bounds_returns_nil() {
        let board = Board(rows: 3, columns: 3)

        XCTAssertNil(board[10, 10])
    }

    func test_init_with_matrix_unequal() throws {
        XCTAssertThrowsError(try Board(matrix: [[1], [1, 2]])) { error in
            XCTAssertEqual(error as? BoardCreationError, BoardCreationError.notEqualNumberOfColumns)
        }
    }

    func test_init_with_matrix_equal() throws {
        let board = try Board(matrix: [[1, 0], [1, 2], [4,2]])

        XCTAssertEqual(board[0, 0], 1)
        XCTAssertEqual(board[1, 1], 2)
        XCTAssertEqual(board[2, 0], 4)
        XCTAssertNil(board[2, 2])
        XCTAssertEqual(board.rows, 3)
        XCTAssertEqual(board.columns, 2)
    }

    func test_make_move_1() throws {
        var board = try Board(matrix: [
            [1, 2, 3],
            [1, 2, 3],
            [1, 2, 3],
            [1, 2, 3]
        ])
        let didMakeMove = board.makeMove(2)
        let expected = [
            [2, 2, 3],
            [2, 2, 3],
            [2, 2, 3],
            [2, 2, 3]
        ]

        XCTAssertEqual(board.matrix, expected)
        XCTAssertEqual(didMakeMove, true)
    }

    func test_make_move_2() throws {
        var board = try Board(matrix: [
            [1, 2, 1],
            [1, 2, 1],
            [1, 1, 1],
            [1, 2, 3]
        ])
        let didMakeMove = board.makeMove(2)
        let expected = [
            [2, 2, 2],
            [2, 2, 2],
            [2, 2, 2],
            [2, 2, 3]
        ]

        XCTAssertEqual(board.matrix, expected)
        XCTAssertEqual(didMakeMove, true)
    }

    func test_make_move_3() throws {
        var board = try Board(matrix: [
            [1, 2, 3],
            [2, 2, 3],
            [1, 2, 3],
            [1, 2, 3]
        ])
        let didMakeMove = board.makeMove(3)
        let expected = [
            [3, 2, 3],
            [2, 2, 3],
            [1, 2, 3],
            [1, 2, 3]
        ]

        XCTAssertEqual(board.matrix, expected)
        XCTAssertEqual(didMakeMove, true)
    }

    func test_make_move_4() throws {
        var board = try Board(matrix: [
            [1, 2, 3],
            [1, 2, 3],
            [2, 3, 3],
            [1, 2, 3]
        ])
        let didMakeMove = board.makeMove(3)
        let expected = [
            [3, 2, 3],
            [3, 2, 3],
            [2, 3, 3],
            [1, 2, 3]
        ]

        XCTAssertEqual(board.matrix, expected)
        XCTAssertEqual(didMakeMove, true)
    }

    func test_make_move_5() throws {
        var board = try Board(matrix: [
            [1, 2, 3],
            [1, 2, 3],
            [1, 2, 3],
            [1, 2, 3]
        ])
        let didMakeMove = board.makeMove(1)
        let expected = [
            [1, 2, 3],
            [1, 2, 3],
            [1, 2, 3],
            [1, 2, 3]
        ]

        XCTAssertEqual(board.matrix, expected)
        XCTAssertEqual(didMakeMove, false)
    }

    func test_is_complete_negative() throws {
        let matrix = [[1, 2], [2, 2]]
        let board = try Board(matrix: matrix)
        XCTAssertFalse(board.isComplete)
    }

    func test_is_complete_positive() throws {
        let matrix = [[2, 2], [2, 2]]
        let board = try Board(matrix: matrix)
        XCTAssertTrue(board.isComplete)
    }

}
