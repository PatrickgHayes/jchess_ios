//
//  ChessTileTests.swift
//  jchessTests
//
//  Created by Patrick Hayes on 6/11/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import XCTest
@testable import jchess

class ChessTileTests: XCTestCase {

    func testValidTile() {
        do {
            let tile = try ChessTile(row: 0, col: 7)
            XCTAssert(tile.row == 0 && tile.col == 7)
        } catch {
            XCTFail()
        }
        
        do {
            let tile = try ChessTile(row: 7, col: 0)
            XCTAssert(tile.row == 7 && tile.col == 0)
        } catch {
            XCTFail()
        }
    }
    
    func testInvalidTile() {
        XCTAssertThrowsError(try ChessTile(row: -1, col: 0)) {
            error in XCTAssertEqual(error as! ChessTile.ValidationError, ChessTile.ValidationError.outOfBounds)
        }
        
        XCTAssertThrowsError(try ChessTile(row: 0, col: -1)) {
            error in XCTAssertEqual(error as! ChessTile.ValidationError, ChessTile.ValidationError.outOfBounds)
        }
        
        XCTAssertThrowsError(try ChessTile(row: 8, col: 0)) {
            error in XCTAssertEqual(error as! ChessTile.ValidationError, ChessTile.ValidationError.outOfBounds)
        }
        
        XCTAssertThrowsError(try ChessTile(row: 0, col: 8)) {
            error in XCTAssertEqual(error as! ChessTile.ValidationError, ChessTile.ValidationError.outOfBounds)
        }
    }

}
