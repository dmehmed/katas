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
    
    func add(string numbers: String) -> Int {
        
        numbersInput = numbers
        
        if hasCustomSeparator() {
            separatorsString += getCustomSeparator()
            removeCustomSeparatorInput()
        }
        
        let separators = CharacterSet(charactersIn: separatorsString)
        
        let numbersArray = numbersInput.components(separatedBy: separators).map() { Int($0) ?? 0 }
        
        return numbersArray.reduce(0) { $0 + $1 }
    }
    
    private func hasCustomSeparator() -> Bool {
        numbersInput.contains("//")
    }
    
    private func getCustomSeparator() -> String {
        getCustomSeparatorInput().components(separatedBy: "//").last ?? ""
    }
    
    private func removeCustomSeparatorInput() {
        numbersInput = numbersInput.replacingOccurrences(of: "\(getCustomSeparatorInput())\n",
                                                         with: "")
    }
    
    private func getCustomSeparatorInput() -> String {
        numbersInput.components(separatedBy: "\n")[0]
    }
    
}
