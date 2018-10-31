//
//  ToDoUITests.swift
//  ToDoUITests
//
//  Created by paul on 10/21/18.
//  Copyright © 2018 PoHung Wang. All rights reserved.
//

import XCTest

class ToDoUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
    }
    
    func testCellNumberRemainTheSameAfterEditCellCancel(){
        let app = XCUIApplication()
        let table = app.tables.element(boundBy: 0)
        let cellcount = table.cells.count
        
        let tablesQuery = app.tables
        tablesQuery.staticTexts["hello"].tap()
        let editItemNavigationBar = app.navigationBars["Edit Item"]
        editItemNavigationBar.buttons["Cancel"].tap()
        
        XCTAssertEqual(table.cells.count, cellcount)
        
    }
    
    func testCellTextRemainSameAfterEditCellCancel(){
        let app = XCUIApplication()
        let tablesQuery = app.tables
        let orginalText = tablesQuery.staticTexts["hello"].value as! String
        tablesQuery.staticTexts["hello"].tap()
        let editItemNavigationBar = app.navigationBars["Edit Item"]
        editItemNavigationBar.buttons["Cancel"].tap()
        let newText = tablesQuery.staticTexts["hello"].value as! String
        
        XCTAssertEqual(newText, orginalText)
        
    }
    
    

}
