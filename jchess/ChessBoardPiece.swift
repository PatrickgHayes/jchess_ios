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
