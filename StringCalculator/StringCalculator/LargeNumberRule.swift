//
//  LargeNumberRule.swift
//  StringCalculator
//
//  Created by Deniz Mehmed on 6.12.21.
//

class LargeNumberRule: Rule {
    
    func isValid(_ value: Int) throws -> Bool {
        value < 1001
    }
    
}

