//
//  SwiftTestingAppUITests.swift
//  SwiftTestingAppUITests
//
//  Created by Matteo Buompastore on 08/05/23.
//

import XCTest

final class SwiftTestingAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func addItem() {
        let app = XCUIApplication()
        app.launch()
        let addButton = app.navigationBars["SwiftTestingApp.View"].buttons["Add"]
        let elementQuery = app.alerts["Add Item"].scrollViews.otherElements
        let textField = elementQuery.collectionViews.textFields["Enter item"]
        let okButton = elementQuery.buttons["OK"]
        
        let addedCell = app.tables.cells.containing(.staticText, identifier: "my to do").element
        
        addButton.tap()
        textField.tap()
        textField.typeText("my to do")
        okButton.tap()
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        
        let app = XCUIApplication()
        app.launch()
        let addButton = app.navigationBars["SwiftTestingApp.View"].buttons["Add"]
        let elementQuery = app.alerts["Add Item"].scrollViews.otherElements
        let textField = elementQuery.collectionViews.textFields["Enter item"]
        let okButton = elementQuery.buttons["OK"]
        
        let addedCell = app.tables.cells.containing(.staticText, identifier: "my to do").element
        
        addButton.tap()
        textField.tap()
        textField.typeText("my to do")
        okButton.tap()
        
        XCTAssertTrue(addedCell.exists)
                
        

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testDeleteItem() {
        let app = XCUIApplication()
        app.launch()
        let addButton = app.navigationBars["SwiftTestingApp.View"].buttons["Add"]
        let elementQuery = app.alerts["Add Item"].scrollViews.otherElements
        let textField = elementQuery.collectionViews.textFields["Enter item"]
        let okButton = elementQuery.buttons["OK"]
        
        let addedCell = app.tables.cells.containing(.staticText, identifier: "my to do").element
        
        addButton.tap()
        textField.tap()
        textField.typeText("my to do")
        okButton.tap()
        
        let tablesQuery = app.tables
        addedCell.swipeLeft()
        tablesQuery.buttons["Delete"].tap()
        
        XCTAssertFalse(addedCell.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
