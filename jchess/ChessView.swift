//
//  ChessView.swift
//  jchess
//
//  Created by Patrick Hayes on 5/21/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import SwiftUI

struct ChessView: View {
    @EnvironmentObject private var chessBoard: ChessBoard
    @State var userInput = ""
    @State var secretImage = "lock"
    var c1 = Color.green
    var c2 = Color.yellow
    
    var body: some View {
        VStack {
            VStack (spacing: 0){
                ChessBoardRow(row: self.chessBoard.board[0], id: "r1", colors: [c1, c2, c1, c2, c1, c2, c1, c2])
                ChessBoardRow(row: self.chessBoard.board[1], id: "r2", colors: [c2, c1, c2, c1, c2, c1, c2, c1])
                ChessBoardRow(row: self.chessBoard.board[2], id: "r3", colors: [c1, c2, c1, c2, c1, c2, c1, c2])
                ChessBoardRow(row: self.chessBoard.board[3], id: "r4", colors: [c2, c1, c2, c1, c2, c1, c2, c1])
                ChessBoardRow(row: self.chessBoard.board[4], id: "r5", colors: [c1, c2, c1, c2, c1, c2, c1, c2])
                ChessBoardRow(row: self.chessBoard.board[5], id: "r6", colors: [c2, c1, c2, c1, c2, c1, c2, c1])
                ChessBoardRow(row: self.chessBoard.board[6], id: "r7", colors: [c1, c2, c1, c2, c1, c2, c1, c2])
                ChessBoardRow(row: self.chessBoard.board[7], id: "r8", colors: [c2, c1, c2, c1, c2, c1, c2, c1])
            }
            TextField("Enter your command", text: $userInput)
            Button(action: {
                self.chessBoard.executeCommand(userInput: self.userInput)
                self.chessBoard.sendCommandToServer(userInput: self.userInput)
            } ) {
                Text("Submit")
            }
            Image(secretImage)
            .resizable()
            .frame(width: 100.0, height: 100.0)
            Button(action: {
                let url = URL(string: "http://localhost:8081/secret")!
                let task = URLSession.shared.dataTask(with: url) {
                    (data, response, error) in
                    guard let data = data else { return }
                    self.secretImage = String(data: data, encoding: .utf8)!
                }
                task.resume()
            }) {
                Text("Secret")
            }
            Spacer()
        }
    }
}

struct ChessView_Previews: PreviewProvider {
    static var previews: some View {
        ChessView().environmentObject(ChessBoard())
    }
}
