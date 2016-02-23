//
//  RecentGamesUITests.swift
//  PivotalPong
//
//  Created by Pivotal on 2/22/16.
//  Copyright © 2016 Pivotal. All rights reserved.
//

import XCTest

class RecentGamesUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launchEnvironment = ["resetData":"1"]
        app.launch()
    }
    
    func test_createGameButtonExists() {
        XCTAssert(app.buttons["Create Game"].exists)
    }
        
    func test_recordsAWinner() {
        app.buttons["Create Game"].tap()
        XCTAssert(app.staticTexts["Log Game"].exists)
        app.cells.staticTexts["Shanfan"].tap()
        XCTAssert(app.staticTexts["Pivotal Pong Rulerz!!"].exists)
        XCTAssert(app.cells.staticTexts["Shanfan is a ruler!!"].exists)
    }
    
    func test_newestWinnerAppearsAtTopOfList() {
        app.buttons["Create Game"].tap()
        XCTAssert(app.staticTexts["Log Game"].exists)
        app.cells.staticTexts["Shanfan"].tap()
        XCTAssert(app.staticTexts["Pivotal Pong Rulerz!!"].exists)
        
        app.buttons["Create Game"].tap()
        XCTAssert(app.staticTexts["Log Game"].exists)
        app.cells.staticTexts["Jen"].tap()
        XCTAssert(app.staticTexts["Pivotal Pong Rulerz!!"].exists)
        
        let topCellTexts = app.cells.elementBoundByIndex(0).staticTexts
        let bottomCellTexts = app.cells.elementBoundByIndex(1).staticTexts
        
        XCTAssert(topCellTexts["Jen is a ruler!!"].exists)
        XCTAssert(bottomCellTexts["Shanfan is a ruler!!"].exists)
    }
    
    func test_persistsRecentGames() {
        app.buttons["Create Game"].tap()
        XCTAssert(app.staticTexts["Log Game"].exists)
        app.cells.staticTexts["Shanfan"].tap()
        XCTAssert(app.staticTexts["Pivotal Pong Rulerz!!"].exists)
        XCTAssert(app.cells.staticTexts["Shanfan is a ruler!!"].exists)
        
        app.terminate()
        app.launchEnvironment = [:]
        app.launch()
        
        XCTAssert(app.cells.staticTexts["Shanfan is a ruler!!"].exists)
    }
}
