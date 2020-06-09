//
//  ChessClient.swift
//  jchess
//
//  Created by Aaron Graham on 6/5/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import Foundation

protocol ChessClientDelegate {
    func clientReceivedMessage(text: String)
}

class ChessClient : WebSocketConnectionDelegate {
    
    var webSocketConnection: WebSocketConnection!
    var delegate: ChessClientDelegate?
    
    init() {
        self.webSocketConnection = WebSocketTaskConnection(url: URL(string: "ws://0.0.0.0:8080/chess")!)
        self.webSocketConnection.delegate = self
        self.webSocketConnection.connect()
        
    }
    
    func onConnected(connection: WebSocketConnection) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        }
        print("Connected")
    }
    
    func onDisconnected(connection: WebSocketConnection, error: Error?) {
        if let error = error {
                   print("Disconnected with error:\(error)")
               } else {
                   print("Disconnected normally")
               }
    }
    
    func onError(connection: WebSocketConnection, error: Error) {
        print("Connection error:\(error)")
    }
    
    func onMessage(connection: WebSocketConnection, text: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.delegate?.clientReceivedMessage(text: text)
        }
    }
    
    func onMessage(connection: WebSocketConnection, data: Data) {
        print("Data message: \(data)")
    }
}
