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
    var pieceImage : String {ChessTile.getChessTileImage(piece: piece)}
    var id: String
    
    var body: some View {
        Image(pieceImage)
            .resizable()
            .frame(width: 20.0, height: 20.0)
            .padding(.all, 5)
            .accessibility(label: Text(pieceImage))
            .accessibility(identifier: "chess piece " + id)
    }
}

struct ChessBoardPiece_Previews: PreviewProvider {
    static var previews: some View {
        ChessBoardPiece(piece: Character("r"), id: "r1c1")
    }
}
