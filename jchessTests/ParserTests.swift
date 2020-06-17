//
//  ParserTests.swift
//  jchessTests
//
//  Created by Patrick Hayes on 6/15/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import XCTest
@testable import jchess

class ParserTests: XCTestCase {
    
    func testParseValidMove() {
        let parser = Parser()
        let chessBoard = ChessBoard()
        
        let userInput = "Move r2c2 r3c2"
        
        let command : Command
        do {
            command = try parser.parse(user_input: userInput, chessBoard: chessBoard)
            let move = command as! Move
            let oldTile =  try ChessTile(row: 1, col: 1)
            let newTile =  try ChessTile(row: 2, col: 1)
            XCTAssertEqual(move.new_tile, newTile)
            XCTAssertEqual(move.old_tile, oldTile)
            
        } catch {
            XCTFail()
        }
    }
    
    func testParseInvalidMove() {
        let parser = Parser()
        let chessBoard = ChessBoard()
        
        let userInput = "Move the king forward 2"
        
        XCTAssertThrowsError(try parser.parse(user_input: userInput, chessBoard: chessBoard)) {
            error in XCTAssertEqual(error as! Parser.ValidationError, Parser.ValidationError.invalidMoveCommandEntry)
        }
    }
    
    func testParseValidPlace() {
        let parser = Parser()
        let chessBoard = ChessBoard()
        
        let userInput = "Place Q r4c4"
        
        let command : Command
        do {
            command = try parser.parse(user_input: userInput, chessBoard: chessBoard)
            let place = command as! Place
            let tile =  try ChessTile(row: 3, col: 3)
            let piece =  Character("Q")
            XCTAssertEqual(place.tile, tile)
            XCTAssertEqual(place.piece, piece)
            
        } catch {
            XCTFail()
        }
    }
    
    func testParseInvalidPlace() {
        let parser = Parser()
        let chessBoard = ChessBoard()
        
        let userInput = "Place a Queen on the forth column forth row"
        
        XCTAssertThrowsError(try parser.parse(user_input: userInput, chessBoard: chessBoard)) {
            error in XCTAssertEqual(error as! Parser.ValidationError, Parser.ValidationError.invalidPlaceCommandEntry)
        }
    }
    
    func testInvalidUserInput() {
        let parser = Parser()
        let chessBoard = ChessBoard()
        
        let userInput = "Garbage user input"
        
        XCTAssertThrowsError(try parser.parse(user_input: userInput, chessBoard: chessBoard)) {
            error in XCTAssertEqual(error as! Parser.ValidationError, Parser.ValidationError.invalidCommand)
        }
    }
    
    func testParseCoordinatePlaceCommand() {
        let parser = Parser()
        let chessBoard = ChessBoard()
        
    }

    func testParseCoordinateMoveCommand() {
        let parser = Parser()
        let chessBoard = ChessBoard()
        
    }
}
