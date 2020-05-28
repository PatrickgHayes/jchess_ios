//
//  chessboard.swift
//  jchess
//
//  Created by Patrick Hayes on 5/21/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import SwiftUI

struct chessboard: View {
    @EnvironmentObject private var chessBoard: ChessBoard
    
    var body: some View {
        ZStack {
            Image("chessbd")
                .resizable()
                .frame(width: 300.0, height: 300.0)
            VStack {
                ChessBoardRow(row: self.chessBoard.board[0])
                ChessBoardRow(row: self.chessBoard.board[1])
                ChessBoardRow(row: self.chessBoard.board[2])
                ChessBoardRow(row: self.chessBoard.board[3])
                ChessBoardRow(row: self.chessBoard.board[4])
                ChessBoardRow(row: self.chessBoard.board[5])
                ChessBoardRow(row: self.chessBoard.board[6])
                ChessBoardRow(row: self.chessBoard.board[7])
            }
        }
    }
}

struct chessboard_Previews: PreviewProvider {
    static var previews: some View {
        chessboard().environmentObject(ChessBoard())
    }
}
