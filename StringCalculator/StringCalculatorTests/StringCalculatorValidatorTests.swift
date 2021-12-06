//
//  StringCalculatorValidatorTests.swift
//  StringCalculatorTests
//
//  Created by Deniz Mehmed on 6.12.21.
//

import XCTest
@testable import StringCalculator

class StringCalculatorValidatorTests: XCTestCase {
    
    var rule: Rule!
    var validator: Validator!
    
    override func setUp() {
        rule = NegativeNumberRule()
        validator = StringCalculatorValidator()
    }
    
    func testNegativeNumber() {
        validator.add(rule: rule)
        XCTAssertThrowsError(try validator.isValid(-1))
    }
    
    func testPositiveNumber() {
        validator.add(rule: rule)
        XCTAssertNoThrow(try validator.isValid(1))
    }
    
}
