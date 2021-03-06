//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Deniz Mehmed on 1.12.21.
//

import XCTest
@testable import StringCalculator

class StringCalculatorTests: XCTestCase {
    
    private var stringCalculator: StringCalculator!
    
    override func setUp() {
        
        let validator = StringCalculatorValidator()
        
        validator.add(rule: NegativeNumberRule())
        validator.add(rule: LargeNumberRule())
        
        stringCalculator = StringCalculator(with: DefaultStringSplitter(), and: validator)
        
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
    
    func testAddNumbersWithNewlineInString() {
        verify("1\n2,3", result: 6)
        verify("1\n2,3,4\n5", result: 15)
        verify("1,\n2", result: 3)
    }
    
    func testAddNumbersWithCustomSeparators() {
        verify("//;\n1;2", result: 3)
        verify("//!\n1!2,3!4\n5", result: 15)
    }
    
//    func testAddNumbersWithNegativeNumbersInString() {
//        
//        XCTAssertThrowsError(try stringCalculator.add("1,-2,-3")) { error in
//            XCTAssertEqual(error as! StringCalculatorError, StringCalculatorError.NegativeNumbersNotAllowed("Error: negatives not allowed: -2 -3"))
//        }
//        
//    }
    
    func testAddNumbersToIgnorNumbersBiggerThanThousand() {
        verify("1001,2", result: 2)
    }
    
    func testAddNumbersWithArbitraryLengthSeparators() {
        verify("//[***]\n1***2***3", result: 6)
    }
    
    func testAddNumbersWithMultipleSingleLengthSeparators() {
        verify("//[*][%]\n1*2%3", result: 6)
    }
    
    func testAddNumbersWithMultipleLongerLengthSeparators() {
        verify("//[foo][bar]\n1foo2bar3", result: 6)
    }
    
    func testAddNumberWithSquareBracketInString() {
        verify("//[\n1[2[3", result: 6)
    }
    
    private func verify(
        _ input: String,
        result: Int,
        line: UInt = #line
    ) {
        XCTAssertEqual(try stringCalculator.add(input), result, line: line)
    }
    
}
