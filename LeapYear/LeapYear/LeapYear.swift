//
//  LeapYear.swift
//  LeapYear
//
//  Created by Deniz Mehmed on 2.12.21.
//

import Foundation

class LeapYear {
    
    func isLeapYear(year: Int) -> Bool {
        
        if year % 100 == 0, year % 400 != 0 {
            return false
        }
        
        if year % 4 == 0 {
            return true
        }
        
        if year % 400 == 0 {
            return true
        }
        
        return false
        
    }
    
}
