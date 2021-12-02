//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Deniz Mehmed on 1.12.21.
//

import Foundation

class StringCalculator {
    
    var separatorsString = ",\n"
    var numbersInput = ""
    
    func add(string numbersString: String) throws -> Int {
        
        numbersInput = numbersString
        
        if hasCustomSeparator() {
            separatorsString += getCustomSeparator()
            numbersInput = getNumbersInputWithoutCustomSeparator()
        }
        
        let separators = CharacterSet(charactersIn: separatorsString)
        
        let numbersArray = numbersInput.components(separatedBy: separators).compactMap() { Int($0) }
        
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
    
}
