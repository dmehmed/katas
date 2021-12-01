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
        verify("7,9", result: 16)
    }
    
    func testAddNumbersWithMultipleNumbersInString() {
        verify("1,2,3,4,5,6,7,8,9", result: 45)
        verify("10,22,31,49", result: 112)
        verify("1,2,11,19,0,1,1,1,1,1,1,1,1,1", result: 42)
    }
    
    private func verify(
        _ input: String,
        result: Int,
        line: UInt = #line
    ) {
        XCTAssertEqual(stringCalculator.add(string: input), result, line: line)
    }
    
}
