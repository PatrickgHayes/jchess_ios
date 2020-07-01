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
    var colors: [Color]
    
    var body: some View {
        HStack (spacing: 0){
            ChessBoardPiece(piece: row[0], id: id + "c1", color: colors[0])
            ChessBoardPiece(piece: row[1], id: id + "c2", color: colors[1])
            ChessBoardPiece(piece: row[2], id: id + "c3", color: colors[2])
            ChessBoardPiece(piece: row[3], id: id + "c4", color: colors[3])
            ChessBoardPiece(piece: row[4], id: id + "c5", color: colors[4])
            ChessBoardPiece(piece: row[5], id: id + "c6", color: colors[5])
            ChessBoardPiece(piece: row[6], id: id + "c7", color: colors[6])
            ChessBoardPiece(piece: row[7], id: id + "c8", color: colors[7])
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
                            Character("P")], id: "r1", colors: [Color.green, Color.yellow, Color.green, Color.yellow, Color.green, Color.yellow, Color.green, Color.yellow])
    }
}
