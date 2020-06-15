//
//  ChessBoardTests.swift
//  jchessTests
//
//  Created by Patrick Hayes on 6/11/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import XCTest
@testable import jchess

class ChessBoardTests: XCTestCase {
    
//    func getTilePiece(chessTile : ChessTile) -> Character {
//        return board[chessTile.row][chessTile.col]
//    }
//
//    func setTilePiece(chessTile : ChessTile, piece : Character) {
//        board[chessTile.row][chessTile.col] = piece
//    }
//
//    func executeCommand(userInput: String) {
//        let parser = Parser()
//        do {
//            let command = try parser.parse(user_input: userInput, chessBoard: self)
//            command.execute()
//        }
//        catch {
//            print(error.localizedDescription)
//        }
//    }

    func testChessBoardInitializer()  {
        let expectedChessBoard : [[Character]]
        expectedChessBoard = [["R","N","B","Q","K","B","N","R"],
                              ["P","P","P","P","P","P","P","P"],
                              [" "," "," "," "," "," "," "," "],
                              [" "," "," "," "," "," "," "," "],
                              [" "," "," "," "," "," "," "," "],
                              [" "," "," "," "," "," "," "," "],
                              ["p","p","p","p","p","p","p","p"],
                              ["r","n","b","q","k","b","n","r"]]
        
        let chessBoard = ChessBoard()
        XCTAssertEqual(chessBoard.board, expectedChessBoard)
    }
    
    func testSetTilePiece() {
        let chessBoard = ChessBoard()
        XCTAssertEqual(chessBoard.board[0][0], Character("R"))
        chessBoard.setTilePiece(ChessTile(row: 0, col: 0), Character("Q"))
        XCTAssertEqual(chessBoard, <#T##expression2: Equatable##Equatable#>)
    }
}
