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
    
//    enum ValidationError : Error {
//        case invalidCommand
//        case invalidMoveCommandEntry
//        case invalidPlaceCommandEntry
//    }
//
//    let chess_board_size = 8
//
//    func parse(user_input: String, chessBoard: ChessBoard) throws -> Command {
//        let tokens = user_input.components(separatedBy: " ")
//
//        switch(tokens[0]) {
//            case "Move":
//                return try parseCoordinateMoveCommand(tokens: tokens, chessBoard: chessBoard)
//            case "Place":
//                //do {
//                return try parseCoordinatePlaceCommand(tokens: tokens, chessBoard: chessBoard);
//                //    }
//                //} catch (Exception e) {
//                //    throw e;
//                //}
//            //case "undo":
//            //    return new Undo(chessBoard);
//            //case "checkmate":
//            //    return new Checkmate();
//            //case "endturn":
//            //    return new EndTurn();
//            default:
//                throw ValidationError.invalidCommand
//        }
//    }
//
//    func parseCoordinateMoveCommand(tokens: [String], chessBoard: ChessBoard) throws -> Command
//    {
//        if (tokens.count != 3) {
//            throw ValidationError.invalidMoveCommandEntry
//        }
//
//        var index = tokens[1].index(tokens[1].startIndex, offsetBy: 1)
//        let old_row = Int(String(tokens[1][index])) ?? -1
//        index = tokens[1].index(tokens[1].startIndex, offsetBy: 3)
//        let old_col = Int(String(tokens[1][index])) ?? -1
//        index = tokens[2].index(tokens[2].startIndex, offsetBy: 1)
//        let new_row = Int(String(tokens[2][index])) ?? -1
//        index = tokens[2].index(tokens[2].startIndex, offsetBy: 3)
//        let new_col = Int(String(tokens[2][index])) ?? -1
//
//        let old_tile = try ChessTile(row: old_row-1, col: old_col-1)
//        let new_tile = try ChessTile(row: new_row-1, col: new_col-1)
//        return Move(chessBoard: chessBoard, oldTile: old_tile, newTile: new_tile);
//    }
//
//    func parseCoordinatePlaceCommand(tokens: [String], chessBoard: ChessBoard) throws -> Place {
//        if (tokens.count != 3) {
//            throw ValidationError.invalidPlaceCommandEntry
//        }
//        var index = tokens[1].index(tokens[1].startIndex, offsetBy: 0)
//        var piece = Character(String(tokens[1][index]))
//        piece = (piece == "_") ? " " : piece
//        index = tokens[2].index(tokens[2].startIndex, offsetBy: 1)
//        let row = Int(String(tokens[2][index])) ?? -1
//        index = tokens[2].index(tokens[2].startIndex, offsetBy: 3)
//        let col = Int(String(tokens[2][index])) ?? -1
//        let tile = try ChessTile(row: row-1, col: col-1)
//        return Place(chessBoard: chessBoard, piece: piece, tile: tile)
//    }

    
    
//    func parse(user_input: String, chessBoard: ChessBoard) throws -> Command {
    //        let tokens = user_input.components(separatedBy: " ")
    //
    //        switch(tokens[0]) {
    //            case "Move":
    //                return try parseCoordinateMoveCommand(tokens: tokens, chessBoard: chessBoard)
    //            case "Place":
    //                //do {
    //                return try parseCoordinatePlaceCommand(tokens: tokens, chessBoard: chessBoard);
    //                //    }
    //                //} catch (Exception e) {
    //                //    throw e;
    //                //}
    //            //case "undo":
    //            //    return new Undo(chessBoard);
    //            //case "checkmate":
    //            //    return new Checkmate();
    //            //case "endturn":
    //            //    return new EndTurn();
    //            default:
    //                throw ValidationError.invalidCommand
    //        }
    //    }
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
