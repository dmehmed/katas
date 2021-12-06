//
//  LargeNumberRule.swift
//  StringCalculator
//
//  Created by Deniz Mehmed on 6.12.21.
//

class LargeNumberRule: Rule {
    
    private static let UPPER_NUMBER_BOUND = 1000
    
    func isValid(_ value: Int) throws -> Bool {
        value <= LargeNumberRule.UPPER_NUMBER_BOUND
    }
    
}

