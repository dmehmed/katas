//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Deniz Mehmed on 1.12.21.
//

import XCTest
@testable import StringCalculator

class StringCalculatorTests: XCTestCase {
    
    var stringCalculator: StringCalculator!
    
    override func setUp() {
        stringCalculator = StringCalculator()
    }
    
    func testAddNumbersWithEmptyString() {
        verify("", result: 0)
    }
    
    func testAddNumbersWithOneNumberInString() {
        verify("1", result: 1)
        verify("2", result: 2)
        verify("3", result: 3)
    }
    
    func testAddNumbersWithTwoNumbersInString() {
        verify("1,2", result: 3)
    }
    
    private func verify(
        _ input: String,
        result: Int,
        line: UInt = #line
    ) {
        XCTAssertEqual(stringCalculator.add(string: input), result, line: line)
    }
    
}
