//
//  FizzBuzz.swift
//  FizzBuzz
//
//  Created by Deniz Mehmed on 30.11.21.
//

import Foundation

class FizzBuzz {
    
//    func consoleOutputForNumbers( from, to) -> String
    func convert(number: Int) -> String {
        
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
