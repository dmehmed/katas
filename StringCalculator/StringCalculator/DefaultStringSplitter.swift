//
//  DefaultStringSplitter.swift
//  StringCalculator
//
//  Created by Deniz Mehmed on 6.12.21.
//


class DefaultStringSplitter: StringSplitter {
    
    private static let NEW_LINE = "\n"
    private static let COMMA = ","
    private static let TWO_SLASHES = "//"
    private static let SEPARATOR_INPUT_LINE_REGEX = "//(.*?)\n"
    private static let LEFT_SQUARE_BRACKET: Unicode.Scalar = "["
    private static let RIGHT_SQUARE_BRACKET: Unicode.Scalar = "]"
    
    private let defaultSeparators = [DefaultStringSplitter.COMMA, DefaultStringSplitter.NEW_LINE]
    private var negativeNumbersString = ""
    
    func split(_ string: String) -> [String] {
        
        var stringToSplit = string
        var customSeparators: [String] = []
        
        if let separatorsInput = getSeparatorsInput(from: string) {
            customSeparators = getCustomSeparators(from: separatorsInput)
            stringToSplit = stringToSplit.replacingOccurrences(of: "\(DefaultStringSplitter.TWO_SLASHES)\(separatorsInput)\(DefaultStringSplitter.NEW_LINE)", with: "")
        }
        
        let allSeparators = customSeparators + defaultSeparators
        
        for separator in allSeparators {
            stringToSplit = stringToSplit.replacingOccurrences(of: separator, with: DefaultStringSplitter.COMMA)
        }
        
        return stringToSplit.components(separatedBy: DefaultStringSplitter.COMMA)
        
    }
    
}


// MARK: - Helper functions
extension DefaultStringSplitter {
    
    private func getSeparatorsInput(from string: String) -> String? {
        
        if let firstMatch = getFirstMatch(in: string, for: DefaultStringSplitter.SEPARATOR_INPUT_LINE_REGEX) {
            return retrieveGroup(from: string, with: firstMatch)
        }
        
        return nil
        
    }
    
    private func retrieveGroup(from string: String, with result: NSTextCheckingResult) -> String? {
        
        if let separatorRange = Range(result.range(at: 1), in: string) {
            return String(string[separatorRange])
        }
        
        return nil
        
    }
    
    private func getFirstMatch(in string: String, for pattern: String) -> NSTextCheckingResult? {
        return (try! NSRegularExpression(pattern: pattern)).firstMatch(in: string, options: [], range: NSMakeRange(0, string.count))
    }
    
    private func getCustomSeparators(from string: String) -> [String] {
        
        if string.count == 1 {
            return [string]
        }
        
        return string.components(separatedBy: [DefaultStringSplitter.LEFT_SQUARE_BRACKET, DefaultStringSplitter.RIGHT_SQUARE_BRACKET]).compactMap() {
            $0.isEmpty ? nil : $0
        }
        
    }
    
}
