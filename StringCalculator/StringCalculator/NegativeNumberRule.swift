//
//  NegativeNumberRule.swift
//  StringCalculator
//
//  Created by Deniz Mehmed on 6.12.21.
//

class NegativeNumberRule: Rule {
    
    func isValid(_ value: Int) throws -> Bool {
        
        if value < 0 {
            throw NegativeNumberError(value)
        }
        
        return true
        
    }
    
}


struct NegativeNumberError<T>: Error {
    
    let value: T
    
    init(_ value: T) {
        self.value = value
    }
    
}
