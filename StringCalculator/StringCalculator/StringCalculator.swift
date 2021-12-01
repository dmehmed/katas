//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Deniz Mehmed on 1.12.21.
//

import Foundation

class StringCalculator {
    
    func add(string numbers: String) -> Int {
        
        var sum = 0
        
        for numberString in numbers.components(separatedBy: ",") {
            
            if let number = Int(numberString) {
                sum += number
            }
            
        }
        
        return sum
    }
    
}
