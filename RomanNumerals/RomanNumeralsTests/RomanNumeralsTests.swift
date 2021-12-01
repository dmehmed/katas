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
        verify(21, result: "XXI")
        verify(22, result: "XXII")
        verify(23, result: "XXIII")
        verify(25, result: "XXV")
        verify(26, result: "XXVI")
    }
    
    func testConvertForThirties() {
        verify(30, result: "XXX")
        verify(31, result: "XXXI")
        verify(32, result: "XXXII")
        verify(35, result: "XXXV")
        verify(36, result: "XXXVI")
    }
    
    func testConvertForFifties() {
        verify(50, result: "L")
        verify(51, result: "LI")
        verify(52, result: "LII")
        verify(55, result: "LV")
        verify(56, result: "LVI")
    }
    
    private func verify(
        _ number: Int,
        result: String,
        line: UInt = #line
    ) {
        XCTAssertEqual(romanNumerals.convert(number), result, line: line)
    }
    
}
