//
//  GesturePlaygroundView.swift
//  jchess
//
//  Created by Patrick Hayes on 6/18/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import SwiftUI

struct GesturePlaygroundView: View {
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero

    var body: some View {
        VStack {
            Image(systemName: "star.circle.fill")
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
                            self.position.height += value.translation.height
                            self.position.width += value.translation.width
                        })
                )
            Spacer()
            Text("width is: " + String(Int(self.position.width)))
            Text("height is: " + String(Int(self.position.height)))
        }
    }
}

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}

struct GesturePlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        GesturePlaygroundView()
    }
}
