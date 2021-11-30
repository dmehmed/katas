//
//  FizzBuzz.swift
//  FizzBuzz
//
//  Created by Deniz Mehmed on 30.11.21.
//

import Foundation

class FizzBuzz {
    
    func consoleOutputForNumbers(from fromNumber: Int, to toNumber: Int) -> String {
        
        if fromNumber > toNumber {
            return "You need to enter valid range of numbers with second number greater than first number!"
        }
        
        if !checkIsTheNumberPositive(fromNumber) {
            return "You need to enter range of positive numbers!"
        }
        
        var resultString = ""
        
        for number in fromNumber...toNumber {
            
            resultString += convert(number: number)
            
            if number != toNumber {
                resultString += "\n"
            }
            
        }
        
        return resultString
    }
    
    func convert(number: Int) -> String {
        
        // MARK: - Ask if this should be in upper func
        if !checkIsTheNumberPositive(number) {
            return "You need to enter positive number!"
        }
        
        if number.isDivisible(by: 15) {
            return "FizzBuzz"
        }
        
        if number.isDivisible(by: 3) {
            return "Fizz"
        }
        
        if number.isDivisible(by: 5) {
            return "Buzz"
        }
        
        return "\(number)"
        
    }
    
    func checkIsTheNumberPositive(_ number: Int) -> Bool {
        number > 0
    }
    
}

extension Int {
    func isDivisible(by number: Int) -> Bool {
        self % number == 0
    }
}
