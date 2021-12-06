//
//  DefaultStringSplitterTests.swift
//  StringCalculatorTests
//
//  Created by Deniz Mehmed on 6.12.21.
//

import XCTest
@testable import StringCalculator

class DefaultStringSplitterTests: XCTestCase {
    
    private var defaultStringSplitter: DefaultStringSplitter!
    
    override func setUp() {
        defaultStringSplitter = DefaultStringSplitter()
    }
    
    func testEmptyString() {
        let splittedStrings = defaultStringSplitter.split("")
        verify(splittedStrings, result: 1)
    }
    
    func testSimpleCharacter() {
        
        let splittedStrings = defaultStringSplitter.split("a")
        
        verify(splittedStrings, result: 1)
        verify(splittedStrings.first ?? "", result: "a")
        
    }
    
    func testOneElementWithMultipleCharacters() {
        
        let splittedStrings = defaultStringSplitter.split("abz")
        
        verify(splittedStrings, result: 1)
        verify(splittedStrings.first ?? "", result: "abz")
        
    }
    
    func testSplitSingleDigits() {
        
        let splittedStrings = defaultStringSplitter.split("a,b")
        
        verify(splittedStrings, result: 2)
        verify(splittedStrings.first ?? "", result: "a")
        verify(splittedStrings[1], result: "b")
        
    }
    
    func testSplitDoubleDigits() {
        
        let splittedStrings = defaultStringSplitter.split("a1,b2")
        
        verify(splittedStrings, result: 2)
        verify(splittedStrings.first ?? "", result: "a1")
        verify(splittedStrings[1], result: "b2")
        
    }

    func testSplitWithNewLineSeparator() {
        
        let splittedStrings = defaultStringSplitter.split("a31\nb2b")
        
        verify(splittedStrings, result: 2)
        verify(splittedStrings.first ?? "", result: "a31")
        verify(splittedStrings[1], result: "b2b")
        
    }

    func testSplitMultipleSeparators() {
        
        let splittedStrings = defaultStringSplitter.split("a\nb2,b4\naz")
        
        verify(splittedStrings, result: 4)
        verify(splittedStrings.first ?? "", result: "a")
        verify(splittedStrings[1], result: "b2")
        verify(splittedStrings[2], result: "b4")
        verify(splittedStrings[3], result: "az")
        
    }

    func testSplitMultipleSeparatorsWithLeadingSeparator() {
        
        let splittedStrings = defaultStringSplitter.split("\na\nb2,b4\naz")
        
        verify(splittedStrings, result: 5)
        verify(splittedStrings.first ?? "-", result: "")
        verify(splittedStrings[1], result: "a")
        verify(splittedStrings[2], result: "b2")
        verify(splittedStrings[3], result: "b4")
        verify(splittedStrings[4], result: "az")
        
    }

    func testSplitSingleCharacterWithCustomSeparator() {
        
        let splittedStrings = defaultStringSplitter.split("//*\na")
        
        verify(splittedStrings, result: 1)
        verify(splittedStrings.first ?? "", result: "a")
        
    }

    func testSplitSingleDigitsWithCustomSeparators() {
        
        let splittedStrings = defaultStringSplitter.split("//;\na;b")
        
        verify(splittedStrings, result: 2)
        verify(splittedStrings.first ?? "", result: "a")
        verify(splittedStrings[1], result: "b")
        
    }

    func testSplitWithLongerCustomDelimiter() {
        
        let splittedStrings = defaultStringSplitter.split("//!@$\nsto!@$23!@$meh!@$ne!")
        
        verify(splittedStrings, result: 4)
        verify(splittedStrings.first ?? "", result: "sto")
        verify(splittedStrings[1], result: "23")
        verify(splittedStrings[2], result: "meh")
        verify(splittedStrings[3], result: "ne!")
        
    }
    
    private func verify(
        _ input: [String],
        result: Int,
        line: UInt = #line
    ) {
        XCTAssertEqual(input.count, result, line: line)
    }
    
    private func verify(
        _ input: String,
        result: String,
        line: UInt = #line
    ) {
        XCTAssertEqual(input, result, line: line)
    }
    
}
