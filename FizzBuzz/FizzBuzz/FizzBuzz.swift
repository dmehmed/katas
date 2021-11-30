//
//  FizzBuzz.swift
//  FizzBuzz
//
//  Created by Deniz Mehmed on 30.11.21.
//

import Foundation

class FizzBuzz {
    
    func convert(number: Int) -> String {
        
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
