//
//  ChessBoardAsset.swift
//  jchess
//
//  Created by Aaron Graham on 6/30/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import SwiftUI

struct ChessBoardAsset: View {
    var body: some View {
        HStack (spacing: 0) {
            ForEach ((1...4), id: \.self) { i in
                HStack (spacing: 0) {
                    Rectangle()
                        .fill(Color.purple)
                        .aspectRatio(1.0, contentMode: .fit)
                    Rectangle()
                        .fill(Color.yellow)
                        .aspectRatio(1.0, contentMode: .fit)
                }
            }
        }
    }
}

struct ChessBoardAsset_Previews: PreviewProvider {
    static var previews: some View {
        ChessBoardAsset()
    }
}
