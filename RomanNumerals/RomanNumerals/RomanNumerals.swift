//
//  RomanNumerals.swift
//  RomanNumerals
//
//  Created by Deniz Mehmed on 1.12.21.
//

import Foundation

class RomanNumerals {
    
    func convert(_ number: Int) -> String {
        
        var result = ""
        var localNumber = number
        
        if localNumber / 10 != 0 {
            result += String(repeating:"X", count: localNumber / 10)
            localNumber -= (localNumber / 10) * 10
        }
        
        if localNumber >= 5 {
            localNumber -= 5
            result += "V"
        }
        
        result += String(repeating:"I", count: localNumber)
        
        return result
        
    }
    
}
