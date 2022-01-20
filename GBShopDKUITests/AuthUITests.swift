//
//  AuthUITests.swift
//  GBShopDKUITests
//
//  Created by Denis Kazarin on 20.01.2022.
//

import XCTest

class AuthUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
     //   XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
    
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        let elementsQuery = XCUIApplication().scrollViews.otherElements
        let inputLoginTextField = elementsQuery.textFields["Input Login"]
        let inputPasswordTextField = elementsQuery.textFields["Input Password"]
        let loginButton = elementsQuery.buttons["Login"].staticTexts["Login"]
        let logoutButton = elementsQuery/*@START_MENU_TOKEN@*/.buttons["Logout"].staticTexts["Logout"]/*[[".buttons[\"Logout\"].staticTexts[\"Logout\"]",".staticTexts[\"Logout\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
      
        inputLoginTextField.tap()
        inputLoginTextField.typeText("Donald")
        
        loginButton.swipeUp()
                
        inputPasswordTextField.tap()
        inputPasswordTextField.typeText("1234")
        
        loginButton.tap()
        
        logoutButton.tap()
    }
}
