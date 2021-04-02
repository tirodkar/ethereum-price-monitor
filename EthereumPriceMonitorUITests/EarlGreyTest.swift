//
//  EarlGreyTest.swift
//  EthereumPriceMonitorUITests
//
//  Created by Filip Baumgart on 02/04/2021.
//

import XCTest

class MyFirstEarlGreyTest: XCTestCase {

  func testExample() {
    let application: XCUIApplication = XCUIApplication()
    application.launch()
    EarlGrey.selectElement(with: grey_keyWindow())
      .perform(grey_tap())
  }
}
