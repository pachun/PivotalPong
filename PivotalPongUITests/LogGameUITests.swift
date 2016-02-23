import XCTest

class LogGameUITests: XCTestCase {
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launchEnvironment = ["resetData":"1"]
        app.launch()
        app.buttons["Create Game"].tap()
    }
    
    func test_showsPlayers() {
        XCTAssert(app.cells.staticTexts["Shanfan"].exists)
        XCTAssert(app.cells.staticTexts["Jen"].exists)
    }
    
    func test_showsLogGameTitle() {
        XCTAssert(app.staticTexts["Log Game"].exists)
    }
    
    func test_showsCancelButton() {
        XCTAssert(app.buttons["Cancel"].exists)
    }
    
    func test_showsSelectWhoWonLabel() {
        XCTAssert(app.staticTexts["Select Who Won"].exists)
    }
    
    func test_tappingCancelDismissesModal() {
        app.buttons["Cancel"].tap()
        XCTAssert(app.staticTexts["Pivotal Pong Rulerz!!"].exists)
    }
}