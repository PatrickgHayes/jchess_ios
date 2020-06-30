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
    
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    
    var body: some View {
        //VStack {
            Image(pieceImage)
                .resizable()
                .frame(width: 20.0, height: 20.0)
                .padding(.all, 5)
                .accessibility(label: Text(pieceImage))
                .accessibility(identifier: "chess piece " + id)
                .font(.system(size: 100))
                .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
                .animation(.easeInOut)
                .foregroundColor(.green)
                .gesture(
                    DragGesture()
                        .updating($dragOffset, body: { (value, state, transaction) in

                            state = value.translation
                        })
                        .onEnded({value in
                            self.position.height += CGFloat(self.lockValue(val: Int(value.translation.height)))
                            self.position.width += CGFloat(self.lockValue(val: Int(value.translation.width)))
                        })
                )
            //if (piece == "r") {
            //    Text("width is: " + String(Int(self.position.width)))
            //    Text("height is: " + String(Int(self.position.height)))
            //}
        //}
    }
    func lockValue(val: Int) -> Int{
        let mod = val % 38
        if mod > 19 {
            return val + (38 - mod)
        } else {
            return val - mod
        }
    }
}

struct ChessBoardPiece_Previews: PreviewProvider {
    static var previews: some View {
        ChessBoardPiece(piece: Character("r"), id: "r1c1")
    }
}
