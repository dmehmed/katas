//
//  NegativeNumberRuleTests.swift
//  StringCalculatorTests
//
//  Created by Deniz Mehmed on 6.12.21.
//

import XCTest
@testable import StringCalculator

class NegativeNumberRuleTests: XCTestCase {
    
    private var rule: Rule!
    
    override func setUp() {
        rule = NegativeNumberRule()
    }
    
    func testNegativeNumber() {
        XCTAssertThrowsError(try rule.isValid(-1))
    }
    
    func testZero() {
        XCTAssertNoThrow(try rule.isValid(0))
    }
    
    func testPosiiveNumber() {
        XCTAssertNoThrow(try rule.isValid(1))
    }
    
}
