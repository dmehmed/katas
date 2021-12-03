//
//  LeapYear.swift
//  LeapYear
//
//  Created by Deniz Mehmed on 2.12.21.
//

import Foundation

class LeapYear {
    
    func isLeapYear(year: Int) -> Bool {
        return year.isDivisible(by: 400) || ( year.isDivisible(by: 4) && !year.isDivisible(by: 100) )
    }
    
}


// MARK: - Int extension
extension Int {
    
    func isDivisible(by number: Int) -> Bool {
        self % number == 0
    }
    
}
