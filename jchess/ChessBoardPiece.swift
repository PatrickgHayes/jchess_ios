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
    
    @EnvironmentObject private var chessBoard: ChessBoard
    
    var body: some View {
        ZStack (alignment: .center) {
            Rectangle()
                .fill(self.color)
                .aspectRatio(1.0, contentMode: .fit)
            Image(self.pieceImage)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.top, 10)
                .aspectRatio(1.0, contentMode: .fit)
                .accessibility(label: Text(self.pieceImage))
                .accessibility(identifier: "chess piece " + self.id)
            .gesture(
                TapGesture()
                    .onEnded{
                        if (self.chessBoard.tileFrom == "") {
                            self.chessBoard.tileFrom = self.id
                        } else  if (self.chessBoard.tileTo == "") {
                            self.chessBoard.tileTo = self.id
                            self.chessBoard.executeCommand(userInput: "Move " + self.chessBoard.tileFrom + " " + self.chessBoard.tileTo)
                            self.chessBoard.sendCommandToServer(userInput: "Move " + self.chessBoard.tileFrom + " " + self.chessBoard.tileTo)
                            self.chessBoard.tileFrom = ""
                            self.chessBoard.tileTo = ""
                        }
                    })
        }
    }
}

struct ChessBoardPiece_Previews: PreviewProvider {
    static var previews: some View {
        ChessBoardPiece(piece: Character("r"), id: "r1c1", color: Color.green)
    }
}
