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
    
    var body: some View {
        HStack {
            ChessBoardPiece(piece: row[0])
            ChessBoardPiece(piece: row[1])
            ChessBoardPiece(piece: row[2])
            ChessBoardPiece(piece: row[3])
            ChessBoardPiece(piece: row[4])
            ChessBoardPiece(piece: row[5])
            ChessBoardPiece(piece: row[6])
            ChessBoardPiece(piece: row[7])
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
                            Character("P")])
    }
}
