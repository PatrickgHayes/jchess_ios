//
//  PlaceTests.swift
//  jchessTests
//
//  Created by Aaron Graham on 6/15/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import XCTest
@testable import jchess

class PlaceTests: XCTestCase {

    func testValidPlace() {
        do {
            let c = ChessBoard()
            let p = try Place(chessBoard: c, piece: "o", tile: ChessTile(row: 4, col: 4))
            p.execute()
            XCTAssert(c.board[4][4] == "o")
        }
        catch {
            XCTFail()
        }
    }
    
    func testInvalidPlace() {
        let c = ChessBoard()
        XCTAssertThrowsError(try Place(chessBoard: c, piece: "z", tile: ChessTile(row: 8, col: 7)))
    }
}
