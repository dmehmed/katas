//
//  RomanNumerals.swift
//  RomanNumerals
//
//  Created by Deniz Mehmed on 1.12.21.
//

import Foundation

enum RomanNumbers: Int, CaseIterable {
    case I = 1
    case V = 5
    case X = 10
    case L = 50
    case C = 100
    case D = 500
    case M = 1000
    
    var stringValue: String {
        
        switch self {
        case .I:
            return "I"
        case .V:
            return "V"
        case .X:
            return "X"
        case .L:
            return "L"
        case .C:
            return "C"
        case .D:
            return "D"
        case .M:
            return "M"
        }
        
    }
    
}

class RomanNumerals {
    
    func convert(_ number: Int) -> String {
        
        var result = ""
        var localNumber = number
        
        var romanNumbers = RomanNumbers.allCases
        
        while localNumber > 0 {
            
            if let romanSymbol = romanNumbers.last?.stringValue,
               let divider = romanNumbers.last?.rawValue,
               localNumber / divider != 0 {
                
                result += String(repeating: romanSymbol,
                                 count: localNumber / divider)
                localNumber -= ( localNumber / divider ) * divider
                
            }
            
            romanNumbers.removeLast()
            
        }
        
        return result
        
    }
    
}
