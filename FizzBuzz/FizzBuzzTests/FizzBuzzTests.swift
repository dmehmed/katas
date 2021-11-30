//
//  FizzBuzzTests.swift
//  FizzBuzzTests
//
//  Created by Deniz Mehmed on 30.11.21.
//

import XCTest
@testable import FizzBuzz

class FizzBuzzTests: XCTestCase {

    var fizzBuzz: FizzBuzz!
    
    override func setUp() {
        fizzBuzz = FizzBuzz()
    }
    
    func testShouldReturnTheNumberItself() {
        verifyThat(fizzBuzz.convert(number: 1), output: "1")
        verifyThat(fizzBuzz.convert(number: 2), output: "2")
        verifyThat(fizzBuzz.convert(number: 4), output: "4")
    }
    
    func testShouldReturnFizzWhenTheNumberIsDividedByThree() {
        verifyThat(fizzBuzz.convert(number: 3), output: "Fizz")
        verifyThat(fizzBuzz.convert(number: 6), output: "Fizz")
        verifyThat(fizzBuzz.convert(number: 9), output: "Fizz")
        verifyThat(fizzBuzz.convert(number: 12), output: "Fizz")
    }
    
    func testShouldReturnFizzWhenTheNumberIsDividedByFive() {
        verifyThat(fizzBuzz.convert(number: 5), output: "Buzz")
        verifyThat(fizzBuzz.convert(number: 10), output: "Buzz")
        verifyThat(fizzBuzz.convert(number: 20), output: "Buzz")
        verifyThat(fizzBuzz.convert(number: 25), output: "Buzz")
    }
    
    func testShouldReturnFizzWhenTheNumberIsDividedByThreeAndFive() {
        verifyThat(fizzBuzz.convert(number: 15), output: "FizzBuzz")
        verifyThat(fizzBuzz.convert(number: 30), output: "FizzBuzz")
        verifyThat(fizzBuzz.convert(number: 45), output: "FizzBuzz")
    }
    

    func testIsTheNumberPositive() {
        XCTAssertTrue(fizzBuzz.checkIsTheNumberPositive(1))
        XCTAssertFalse(fizzBuzz.checkIsTheNumberPositive(0))
        XCTAssertFalse(fizzBuzz.checkIsTheNumberPositive(-1))
    }
    
    func verifyThat(_ result: String, output: String) {
        XCTAssertEqual(result, output)
    }
    
}
