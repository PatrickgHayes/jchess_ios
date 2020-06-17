//
//  ChessBoardRow.swift
//  jchess
//
//  Created by Patrick Hayes on 5/21/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import SwiftUI

struct ChessBoardRow: View {
    var row : [Character]
    
    var id: String
    
    var body: some View {
        HStack {
            ChessBoardPiece(piece: row[0], id: id + "c1")
            ChessBoardPiece(piece: row[1], id: id + "c2")
            ChessBoardPiece(piece: row[2], id: id + "c3")
            ChessBoardPiece(piece: row[3], id: id + "c4")
            ChessBoardPiece(piece: row[4], id: id + "c5")
            ChessBoardPiece(piece: row[5], id: id + "c6")
            ChessBoardPiece(piece: row[6], id: id + "c7")
            ChessBoardPiece(piece: row[7], id: id + "c8")
        }
    }
}

struct ChessBoardRow_Previews: PreviewProvider {
    static var previews: some View {
        ChessBoardRow(row: [Character("P"),
                            Character("P"),
                            Character("P"),
                            Character("P"),
                            Character("P"),
                            Character("P"),
                            Character("P"),
                            Character("P")], id: "r1")
    }
}
