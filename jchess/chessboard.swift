//
//  chessboard.swift
//  jchess
//
//  Created by Patrick Hayes on 5/21/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import SwiftUI

struct chessboard: View {
    var body: some View {
        ZStack {
            Image("chessboard")
                .resizable()
                .frame(width: 300.0, height: 300.0)
            VStack {
                ChessBoardRow()
                ChessBoardRow()
                ChessBoardRow()
                ChessBoardRow()
                ChessBoardRow()
                ChessBoardRow()
                ChessBoardRow()
                ChessBoardRow()
            }
        }
    }
}

struct chessboard_Previews: PreviewProvider {
    static var previews: some View {
        chessboard()
    }
}
