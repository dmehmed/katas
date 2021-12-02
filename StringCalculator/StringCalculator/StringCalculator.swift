//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Deniz Mehmed on 1.12.21.
//

import Foundation

enum StringCalculatorError: Error {
    case NegativeNumbersNotAllowed
}

class StringCalculator {
    
    var separatorsString = ",\n"
    var numbersInput = ""
    var negativeNumbers: [Int] = []
    
    func add(string numbersString: String) throws -> Int {
        
        numbersInput = numbersString
        
        if hasCustomSeparator() {
            separatorsString += getCustomSeparator()
            numbersInput = getNumbersInputWithoutCustomSeparator()
        }
        
        let separators = CharacterSet(charactersIn: separatorsString)
        
        let numbersArray = try numbersInput.components(separatedBy: separators).compactMap() {
            try getNumber(fromString: $0)
        }
        
        return numbersArray.reduce(0) { $0 + $1 }
    }
    
    private func hasCustomSeparator() -> Bool {
        numbersInput.contains("//")
    }
    
    private func getCustomSeparator() -> String {
        
        if let firstInputLine = numbersInput.components(separatedBy: "\n").first {
            return firstInputLine.components(separatedBy: "//").last ?? ""
        }
        
        return ""
        
    }
    
    private func getNumbersInputWithoutCustomSeparator() -> String {
        numbersInput.replacingOccurrences(of: "//\(getCustomSeparator())\n", with: "")
    }
    
    private func getNumber(fromString string: String) throws -> Int {
        
        if let number = Int(string) {
            
            if number < 0 {
                negativeNumbers.append(number)
                throw StringCalculatorError.NegativeNumbersNotAllowed
            }
            
            return number
            
        }
        
        return 0
        
    }
    
}
