//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Deniz Mehmed on 1.12.21.
//

import XCTest
@testable import StringCalculator

class StringCalculatorTests: XCTestCase {
    
    func testAddEmptyString() {
        let stringCalculator = StringCalculator()
        XCTAssertEqual(stringCalculator.add(string: ""), 0)
    }
    
}
