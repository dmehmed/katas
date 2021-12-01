//
//  RomanNumeralsTests.swift
//  RomanNumeralsTests
//
//  Created by Deniz Mehmed on 1.12.21.
//

import XCTest
@testable import RomanNumerals

class RomanNumeralsTests: XCTestCase {
    
    var romanNumerals: RomanNumerals!
    
    override func setUp() {
        romanNumerals = RomanNumerals()
    }
    
    func testConvertOnes() {
        verify(1, result: "I")
        verify(2, result: "II")
        verify(3, result: "III")
        verify(5, result: "V")
        verify(6, result: "VI")
        verify(7, result: "VII")
        verify(8, result: "VIII")
    }
    
    func testConvertTens() {
        verify(10, result: "X")
        verify(11, result: "XI")
        verify(12, result: "XII")
        verify(13, result: "XIII")
        verify(15, result: "XV")
        verify(16, result: "XVI")
        verify(17, result: "XVII")
    }
    
    func testConvertTwenties() {
        verify(20, result: "XX")
    }
    
    private func verify(
        _ number: Int,
        result: String,
        line: UInt = #line
    ) {
        XCTAssertEqual(romanNumerals.convert(number), result, line: line)
    }
    
}
