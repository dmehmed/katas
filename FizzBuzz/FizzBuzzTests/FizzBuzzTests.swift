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
    
    func testShouldReturnMessageForZeroOrNegativeNumber() {
        verifyThat(fizzBuzz.convert(number: 0), output: "You need to enter positive number!")
        verifyThat(fizzBuzz.convert(number: -5), output: "You need to enter positive number!")
    }
    
    func testIsTheNumberPositive() {
        XCTAssertTrue(fizzBuzz.checkIsTheNumberPositive(1))
        XCTAssertFalse(fizzBuzz.checkIsTheNumberPositive(0))
        XCTAssertFalse(fizzBuzz.checkIsTheNumberPositive(-1))
    }
    
    func testConsoleOutputForCorrectRangeOfNumbers() {
        verifyThat(fizzBuzz.consoleOutputForNumbers(from: 1, to: 2), output: "1\n2")
        verifyThat(fizzBuzz.consoleOutputForNumbers(from: 7, to: 8), output: "7\n8")
        verifyThat(fizzBuzz.consoleOutputForNumbers(from: 1, to: 3), output: "1\n2\nFizz")
        verifyThat(fizzBuzz.consoleOutputForNumbers(from: 1, to: 15), output: "1\n2\nFizz\n4\nBuzz\nFizz\n7\n8\nFizz\nBuzz\n11\nFizz\n13\n14\nFizzBuzz")
    }
    
    func verifyThat(_ result: String, output: String) {
        XCTAssertEqual(result, output)
    }
    
}
