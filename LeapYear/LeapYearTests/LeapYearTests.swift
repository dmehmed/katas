//
//  LeapYearTests.swift
//  LeapYearTests
//
//  Created by Deniz Mehmed on 2.12.21.
//

import XCTest
@testable import LeapYear

class LeapYearTests: XCTestCase {
    
    private var leapYear: LeapYear!
    
    override func setUp() {
        leapYear = LeapYear()
    }
    
    func testIsLeapYearWithYearNotDivisibleByFour() {
        verifyFalse(1997)
        verifyFalse(2001)
    }
    
    func testIsLeapYearWithYearDivisibleByFourHundred() {
        verifyTrue(1600)
    }
    
    func testIsLeapYearWithYearDivisibleByFour() {
        verifyTrue(1996)
        verifyTrue(2004)
    }
    
    func testIsLeapYearWithYearDivisibleByHundredButNotByFourHundred() {
        verifyFalse(1800)
    }
    
    private func verifyTrue(
        _ input: Int,
        line: UInt = #line
    ) {
        XCTAssertTrue(leapYear.isLeapYear(year: input), line: line)
    }
    
    private func verifyFalse(
        _ input: Int,
        line: UInt = #line
    ) {
        XCTAssertFalse(leapYear.isLeapYear(year: input), line: line)
    }
    
}
