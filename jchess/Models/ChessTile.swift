//
//  ChessTile.swift
//  jchess
//
//  Created by Patrick Hayes on 5/26/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import Foundation

class ChessTile: Equatable {
    static func == (lhs: ChessTile, rhs: ChessTile) -> Bool {
        if lhs.row == rhs.row && lhs.col == rhs.col {
            return true
        } else {
            return false
        }
    }
    
    
    enum ValidationError : Error {
        case outOfBounds
    }
    
    let chess_board_size = 8
    var row: Int
    var col: Int
    
    init(row: Int, col: Int) throws {
        self.row = row
        self.col = col
        
        if (row < 0 || row >= chess_board_size || col < 0 || col >= chess_board_size) {
            throw ValidationError.outOfBounds
        }
    }
    
    static func getChessTileImage(piece: Character) -> String {
        switch(piece) {
            case "p":
                return "black p"
            case "P":
                return "red p"
            case "r":
                return "black r"
            case "R":
                return "red r"
            case "n":
                return "black n"
            case "N":
                return "red n"
            case "b":
                return "black b"
            case "B":
                return "red b"
            case "k":
                return "black k"
            case "K":
                return "red k"
            case "q":
                return "black q"
            case "Q":
                return "red q"
            case " ":
                return "transparent"
            default:
                return "pawn"
        }
    }
    
}
