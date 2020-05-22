//
//  CommandCenter.swift
//  jchess
//
//  Created by Patrick Hayes on 5/21/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import SwiftUI

struct CommandCenter: View {
    @State var userInput = ""
    
    var body: some View {
        Form {
            Text("Hello")
            TextField("move r1c1 r8c8", text: $userInput)
            Button(action: { print(self.userInput ) } ) {
                Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
            }
            Text(userInput)
        }
    }
}

struct CommandCenter_Previews: PreviewProvider {
    static var previews: some View {
        CommandCenter()
    }
}
