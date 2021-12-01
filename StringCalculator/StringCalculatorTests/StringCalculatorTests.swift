//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Deniz Mehmed on 1.12.21.
//

import XCTest
@testable import StringCalculator

class StringCalculatorTests: XCTestCase {
    
    func testAddNumbersWithEmptyString() {
        let stringCalculator = StringCalculator()
        XCTAssertEqual(stringCalculator.add(string: ""), 0)
    }
    
    func testAddNumbersWithOne() {
        let stringCalculator = StringCalculator()
        XCTAssertEqual(stringCalculator.add(string: "1"), 1)
    }
    
    func testAddNumbersWithTwo() {
        let stringCalculator = StringCalculator()
        XCTAssertEqual(stringCalculator.add(string: "2"), 2)
    }
    
}
