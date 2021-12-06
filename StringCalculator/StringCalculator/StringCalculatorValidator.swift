//
//  StringCalculatorValidator.swift
//  StringCalculator
//
//  Created by Deniz Mehmed on 6.12.21.
//

class StringCalculatorValidator: Validator {
    
    private var rules = [Rule]()
    
    func add(rule: Rule) {
        rules.append(rule)
    }
    
    func isValid(_ value: Int) throws -> Bool {
        
        for rule in rules {
            
            if try !rule.isValid(value) {
                return false
            }
            
        }
        
        return true
        
    }
    
}
