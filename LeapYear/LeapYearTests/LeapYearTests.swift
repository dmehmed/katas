//
//  LeapYearTests.swift
//  LeapYearTests
//
//  Created by Deniz Mehmed on 2.12.21.
//

import XCTest
@testable import LeapYear

class LeapYearTests: XCTestCase {
    
    func testIsLeapYearWithYearNotDivisibleByFour() {
        let leapYear = LeapYear()
        XCTAssertFalse(leapYear.isLeapYear(year: 1997))
        XCTAssertFalse(leapYear.isLeapYear(year: 2001))
    }
    
    func testIsLeapYearWithYearDivisibleByFour() {
        let leapYear = LeapYear()
        XCTAssertTrue(leapYear.isLeapYear(year: 1996))
    }
    
}
