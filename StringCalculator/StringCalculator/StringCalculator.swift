//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Deniz Mehmed on 1.12.21.
//

import Foundation

class StringCalculator {
    
    func add(string numbers: String) -> Int {
        
        let separatorsString = ",\n"
        
        let separators = CharacterSet(charactersIn: separatorsString)
        
        let numbersArray = numbers.components(separatedBy: separators).map() { Int($0) ?? 0 }
        
        return numbersArray.reduce(0) { $0 + $1 }
    }
    
}
