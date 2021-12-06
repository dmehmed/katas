//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Deniz Mehmed on 1.12.21.
//

enum StringCalculatorError: Error, Equatable {
    case NegativeNumbersNotAllowed(String)
}

class StringCalculator {
    
    private var stringSplitter: StringSplitter
    private var validator: Validator
    
    init(with stringSplitter: StringSplitter, and validator: Validator) {
        self.stringSplitter = stringSplitter
        self.validator = validator
    }
    
    func add(_ numbersString: String) throws -> Int {
        
        try stringSplitter.split(numbersString).reduce(0) {
            let currentStringNumberValue = ( Int($1) ?? 0 )
            return $0 + (try validator.isValid(currentStringNumberValue) ? currentStringNumberValue : 0)
        }
        
    }
    
}
