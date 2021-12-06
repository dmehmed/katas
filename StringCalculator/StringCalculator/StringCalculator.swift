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
    
    private static let UPPER_NUMBER_BOUND = 1000
    
    private var stringSplitter: DefaultStringSplitter?
    private var negativeNumbersString = ""
    
    init(withStringSplitter stringSplitter: DefaultStringSplitter) {
        self.stringSplitter = stringSplitter
    }
    
    func add(string numbersString: String) throws -> Int {
        
        let numbersArray = stringSplitter?.split(numbersString).compactMap() {
            getNumber(fromString: $0)
        }
        
        if negativeNumbersString.count > 0 {
            throw StringCalculatorError.NegativeNumbersNotAllowed("Error: negatives not allowed: \(negativeNumbersString.trimmingCharacters(in: .whitespaces))")
        }
        
        return numbersArray?.reduce(0) { $0 + $1 } ?? 0
        
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
