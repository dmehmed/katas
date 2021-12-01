//
//  RomanNumerals.swift
//  RomanNumerals
//
//  Created by Deniz Mehmed on 1.12.21.
//

import Foundation

enum RomanSymbols: Int {
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
        
        if localNumber / RomanSymbols.L.rawValue != 0 {
            result += String(repeating:RomanSymbols.L.stringValue,
                             count: localNumber / RomanSymbols.L.rawValue)
            localNumber -= (localNumber / RomanSymbols.L.rawValue) * RomanSymbols.L.rawValue
        }
        
        if localNumber / RomanSymbols.X.rawValue != 0 {
            result += String(repeating:RomanSymbols.X.stringValue,
                             count: localNumber / RomanSymbols.X.rawValue)
            localNumber -= (localNumber / RomanSymbols.X.rawValue) * RomanSymbols.X.rawValue
        }
        
        if localNumber >= RomanSymbols.V.rawValue {
            localNumber -= RomanSymbols.V.rawValue
            result += RomanSymbols.V.stringValue
        }
        
        result += String(repeating:RomanSymbols.I.stringValue,
                         count: localNumber)
        
        return result
        
    }
    
}
