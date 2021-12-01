//
//  RomanNumerals.swift
//  RomanNumerals
//
//  Created by Deniz Mehmed on 1.12.21.
//

import Foundation

class RomanNumerals {
    
    var romanNumbers = [1 : "I",
                        4 : "IV",
                        5 : "V",
                        9 : "IX",
                        10 : "X",
                        40 : "XL",
                        50 : "L",
                        90 : "XC",
                        100 : "C",
                        400 : "CD",
                        500 : "D",
                        900 : "CM",
                        1000 : "M"]
    
    func convert(_ number: Int) -> String {
        
        var result = ""
        var localNumber = number
        //refactor
        for romanNumber in romanNumbers.keys.sorted().reversed() {
            
            while localNumber >= romanNumber {
                //refactor
                result += romanNumbers[romanNumber] ?? ""
                localNumber -= romanNumber
            }
            
        }
        
        return result
        
    }
    
    
    
}
