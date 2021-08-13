//
//  NYTimesPopularUITests.swift
//  NYTimesPopularUITests
//
//  Created by Waris on 12/08/2021.
//

import XCTest

class NYTimesPopularUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDataLoadingOnDetailPage() throws {
        var i = 0
        for aStaticText in app.tables.staticTexts.allElementsBoundByIndex {
            print("\(aStaticText)")
            
            if i == 2 {
                app.navigationBars.buttons.element(boundBy: 0).tap()
                aStaticText.tap()
                break
            }
            i += 1
        }
    }
}
