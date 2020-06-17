//
//  ChessBoardPieceUITests.swift
//  jchessUITests
//
//  Created by Aaron Graham on 6/16/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import XCTest
import jchess

class ChessViewUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        self.app = XCUIApplication()
        self.app.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let i = self.app.images["chess piece r1c1"]
        XCTAssert(i.label == "red r")
    }

}
