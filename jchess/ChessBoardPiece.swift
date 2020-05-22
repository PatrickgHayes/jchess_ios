//
//  ChessBoardPiece.swift
//  jchess
//
//  Created by Patrick Hayes on 5/21/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import SwiftUI

struct ChessBoardPiece: View {
    var body: some View {
        Image("pawn")
            .resizable()
            .frame(width: 20.0, height: 20.0)
            .padding(.all, 5)
    }
}

struct ChessBoardPiece_Previews: PreviewProvider {
    static var previews: some View {
        ChessBoardPiece()
    }
}
