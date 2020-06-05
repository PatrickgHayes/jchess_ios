//
//  AppDelegate.swift
//  jchess
//
//  Created by Patrick Hayes on 5/21/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WebSocketConnectionDelegate {
    
    func onConnected(connection: WebSocketConnection) {
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
        print("Text message: \(text)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.webSocketConnection.send(text: "ping")
        }
    }
    
    func onMessage(connection: WebSocketConnection, data: Data) {
        print("Data message: \(data)")
    }
    
    var webSocketConnection: WebSocketConnection!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        webSocketConnection = WebSocketTaskConnection(url: URL(string: "ws://0.0.0.0:8080/chat")!)
        webSocketConnection.delegate = self
        webSocketConnection.connect()
        webSocketConnection.send(text: "ping")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

