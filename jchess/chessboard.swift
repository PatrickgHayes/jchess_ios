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
    @State var userInput = ""
    @State var networkedText = "Thank you to all the mothers out there!"
    
    func act(userInput: String) {
        let parser = Parser()
        do {
            let command = try parser.parse(user_input: self.userInput, chessBoard: chessBoard)
            command.execute()
            self.userInput = ""
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        VStack {
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
            Text("Hello")
            TextField("move r1c1 r8c8", text: $userInput)
            Button(action: { self.act(userInput: self.userInput ) } ) {
                Text("Button")
            }
            Text(self.networkedText)
            Button(action: {
                guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
                    print("Cannot create URL")
                    return
                }
                let task = URLSession.shared.dataTask(with: url) {
                    (data, URLResponse, Error) in
                    DispatchQueue.main.async {
                        let ot = String(decoding: (data ?? "yup".data(using: .utf8))!, as: UTF8.self)
                        print(ot)
                        self.networkedText = ot                   }
                }
                task.resume()
            }) {
                Text("NButton")
            }
            Spacer()
        }
    }
}

struct chessboard_Previews: PreviewProvider {
    static var previews: some View {
        chessboard().environmentObject(ChessBoard())
    }
}
