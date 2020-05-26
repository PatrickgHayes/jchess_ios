//
//  ChessBoard.swift
//  jchess
//
//  Created by Patrick Hayes on 5/26/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import Foundation

class ChessBoard {
    
    let chess_board_size = 8;
    var chess_board : [[Character]]
    
    init() {
        self.chess_board = [["R","N","B","Q","K","B","N","R"],
                            ["P","P","P","P","P","P","P","P"],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            [" "," "," "," "," "," "," "," "],
                            ["p","p","p","p","p","p","p","p"],
                            ["r","n","b","q","k","b","n","r"]]
    }
    
    func getTilePiece(chessTile : ChessTile) -> Character {
        return chess_board[chessTile.row][chessTile.col]
    }
    
    func setTilePiece(chessTile : ChessTile, piece : Character) {
        chess_board[chessTile.row][chessTile.col] = piece
    }
}
