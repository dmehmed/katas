//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Deniz Mehmed on 1.12.21.
//

import Foundation

class StringCalculator {
    
    func add(string numbers: String) -> Int {
        
        var separatorsString = ",\n"
        
        if numbers.contains("\n"), numbers.contains("//") {
            separatorsString += getCustomSeparator(fromString: numbers)
        }
        
        let separators = CharacterSet(charactersIn: separatorsString)
        
        let numbersArray = numbers.components(separatedBy: separators).map() { Int($0) ?? 0 }
        
        return numbersArray.reduce(0) { $0 + $1 }
    }
    
    private func getCustomSeparator(fromString string: String) -> String {
        let firstPart = string.components(separatedBy: "\n")[0]
        return firstPart.components(separatedBy: "//").last ?? ""
    }
    
}
