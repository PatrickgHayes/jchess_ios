//
//  ChessBoardPiece.swift
//  jchess
//
//  Created by Patrick Hayes on 5/21/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import SwiftUI

struct ChessBoardPiece: View {
    var piece : Character
    var pieceImage : String {getPieceImage(piece: piece)}
    
    var body: some View {
        Image(pieceImage)
            .resizable()
            .frame(width: 20.0, height: 20.0)
            .padding(.all, 5)
    }
    
    func getPieceImage(piece: Character) -> String {
        switch(piece) {
            case "p":
                return "pawn"
            case "P":
                return "pawn"
            case "r":
                return "pawn"
            case "R":
                return "pawn"
            case "n":
                return "pawn"
            case "N":
                return "pawn"
            case "b":
                return "pawn"
            case "B":
                return "pawn"
            case "k":
                return "pawn"
            case "K":
                return "pawn"
            case "q":
                return "pawn"
            case "Q":
                return "pawn"
            case " ":
                return "pawn"
            default:
                return "pawn"
        }
    }
}

struct ChessBoardPiece_Previews: PreviewProvider {
    static var previews: some View {
        ChessBoardPiece(piece: Character("P"))
    }
}
