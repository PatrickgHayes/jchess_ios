//
//  ChessBoard.swift
//  jchess
//
//  Created by Patrick Hayes on 5/26/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import Foundation
import SwiftUI

class ChessBoard: ObservableObject {
    
    let chess_board_size = 8;
    @Published var board : [[Character]]
    
    var client = ChessClient()
    
    init() {
        self.board = [["R","N","B","Q","K","B","N","R"],
                            ["P","P","P","P","P","P","P","P"],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            ["p","p","p","p","p","p","p","p"],
                            ["r","n","b","q","k","b","n","r"]]
        
        self.client.delegate = self
    }
    
    func getTilePiece(chessTile : ChessTile) -> Character {
        return board[chessTile.row][chessTile.col]
    }
    
    func setTilePiece(chessTile : ChessTile, piece : Character) {
        board[chessTile.row][chessTile.col] = piece
    }
    
    func executeCommand(userInput: String) {
        let parser = Parser()
        do {
            let command = try parser.parse(user_input: userInput, chessBoard: self)
            command.execute()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func sendCommandToServer(userInput: String) {
        self.client.webSocketConnection.send(text: userInput)
    }
}


extension ChessBoard: ChessClientDelegate {
    func clientReceivedMessage(text: String) {
        self.executeCommand(userInput: text)
    }
}
