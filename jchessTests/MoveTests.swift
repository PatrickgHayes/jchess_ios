//
//  MoveTests.swift
//  jchessTests
//
//  Created by Aaron Graham on 6/15/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import XCTest
@testable import jchess

class MoveTests: XCTestCase {

    func testValidMove() {
        do {
            let c = ChessBoard()
            let m = try Move(chessBoard: c, oldTile: ChessTile(row: 1, col: 0), newTile: ChessTile(row: 2, col: 0))
            m.execute()
            XCTAssert(c.board[1][0] == " ")
            XCTAssert(c.board[2][0] == "P")
        }
        catch {
            XCTFail()
        }
    }
    
    func testInvalidMove() {
        let c = ChessBoard()
        XCTAssertThrowsError(try Move(chessBoard: c, oldTile: ChessTile(row: 8, col: 0), newTile: ChessTile(row: 7, col: 0)))
    }
}
