//
//  LargeNumberRuleTests.swift
//  StringCalculatorTests
//
//  Created by Deniz Mehmed on 6.12.21.
//

import XCTest
@testable import StringCalculator

class LargeNumberRuleTests: XCTestCase {
    
    private var rule: Rule!
    
    override func setUp() {
        rule = LargeNumberRule()
    }
    
    func testOneThousand() {
        XCTAssertTrue(try rule.isValid(1000))
    }
    
    func testZero() {
        XCTAssertFalse(try rule.isValid(1001))
    }
    
}
