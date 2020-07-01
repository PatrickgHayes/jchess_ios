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
    var color: Color
    
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    
    var body: some View {
        ZStack (alignment: .center) {
            Rectangle()
                .fill(color)
                .aspectRatio(1.0, contentMode: .fit)
            Image(pieceImage)
                .resizable()
                .frame(alignment: .bottom)
                .aspectRatio(1.0, contentMode: .fit)
                .accessibility(label: Text(pieceImage))
                .accessibility(identifier: "chess piece " + id)
        }
    }
    func lockValue(val: Int) -> Int{
        let mod = val % 38
        if mod > 19 {
            return val + (38 - mod)
        } else {
            return val - mod
        }
    }
}

struct ChessBoardPiece_Previews: PreviewProvider {
    static var previews: some View {
        ChessBoardPiece(piece: Character("r"), id: "r1c1", color: Color.green)
    }
}
