//
//  ChessBoardRow.swift
//  jchess
//
//  Created by Patrick Hayes on 5/21/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import SwiftUI

struct ChessBoardRow: View {
    var body: some View {
        HStack {
            ChessBoardPiece()
            ChessBoardPiece()
            ChessBoardPiece()
            ChessBoardPiece()
            ChessBoardPiece()
            ChessBoardPiece()
            ChessBoardPiece()
            ChessBoardPiece()
        }
    }
}

struct ChessBoardRow_Previews: PreviewProvider {
    static var previews: some View {
        ChessBoardRow()
    }
}
