//
//  EthereumPriceMonitorUITests.swift
//  EthereumPriceMonitorUITests
//
//  Created by Filip Baumgart on 30/01/2021.
//

import XCTest

final class EthereumPriceMonitorUITests: XCTestCase {
  private var app: XCUIApplication!
  
  override func setUpWithError() throws {
    app = XCUIApplication()
    continueAfterFailure = false
  }
  
  override func tearDownWithError() throws {
    app = nil
  }
  
  func testPriceViewController() throws {
    app.launch()
    XCTAssertTrue(app.activityIndicators.firstMatch.isHittable)
    
    checkCurrentPriceLabel()
    checkCurrentPriceValue()
    
    XCTAssertFalse(app.activityIndicators.firstMatch.isHittable)
    XCTAssertTrue(app.buttons["updatePriceButton"].exists)
    
    app.buttons["updatePriceButton"].tap()
    XCTAssertEqual(1, app.otherElements.activityIndicators.count)
  }
  
  private func checkCurrentPriceLabel() {
    let currentPriceLabel = app.staticTexts.element(matching: .any, identifier: "currentPrice")
    XCTAssertTrue(currentPriceLabel.waitForExistence(timeout: 2))
    XCTAssertEqual(currentPriceLabel.label, "Current Price:")
  }
  
  private func checkCurrentPriceValue() {
    let currentPriceValue = app.staticTexts.element(matching: .any, identifier: "currentPriceValue")
    XCTAssertTrue(currentPriceValue.label.contains("1 ETH ="))
    XCTAssertTrue(currentPriceValue.label.contains("PLN"))
  }
}
