//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Deniz Mehmed on 1.12.21.
//

import Foundation

enum StringCalculatorError: Error, Equatable {
    case NegativeNumbersNotAllowed(String)
}

class StringCalculator {
    
    private static let NEW_LINE = "\n"
    private static let COMMA = ","
    private static let TWO_SLASHES = "//"
    private static let UPPER_NUMBER_BOUND = 1000
    
    private var separatorsString = ",\n"
    private var negativeNumbersString = ""
    
    func add(string numbersString: String) throws -> Int {
        
        var numbersInput = numbersString
        
        if hasCustomSeparator(fromString: numbersInput) {
            separatorsString += getCustomSeparator(fromString: numbersInput)
            numbersInput = getNumbersInputWithoutCustomSeparator(fromString: numbersInput)
        }
        
        let separators = CharacterSet(charactersIn: separatorsString)
        
        let numbersArray = numbersInput.components(separatedBy: separators).compactMap() {
            getNumber(fromString: $0)
        }
        
        if negativeNumbersString.count > 0 {
            throw StringCalculatorError.NegativeNumbersNotAllowed("Error: negatives not allowed: \(negativeNumbersString.trimmingCharacters(in: .whitespaces))")
        }
        
        return numbersArray.reduce(0) { $0 + $1 }
    }
    
    private func hasCustomSeparator(fromString string: String) -> Bool {
        string.contains(StringCalculator.TWO_SLASHES)
    }
    
    private func getCustomSeparator(fromString string: String) -> String {
        
        if let firstInputLine = string.components(separatedBy: StringCalculator.NEW_LINE).first {
            return firstInputLine.components(separatedBy: StringCalculator.TWO_SLASHES).last ?? ""
        }
        
        return ""
        
    }
    
    private func getNumbersInputWithoutCustomSeparator(fromString string: String) -> String {
        string.replacingOccurrences(of: "\(StringCalculator.TWO_SLASHES)\(getCustomSeparator(fromString: string))\(StringCalculator.NEW_LINE)", with: "")
    }
    
    private func getNumber(fromString string: String) -> Int {
        
        if let number = Int(string) {
            
            if number < 0 {
                negativeNumbersString += "\(string) "
                return 0
            }
            
            return number > StringCalculator.UPPER_NUMBER_BOUND ? 0 : number
            
        }
        
        return 0
        
    }
    
}
