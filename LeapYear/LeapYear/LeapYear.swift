//
//  LeapYear.swift
//  LeapYear
//
//  Created by Deniz Mehmed on 2.12.21.
//

import Foundation

class LeapYear {
    
    func isLeapYear(year: Int) -> Bool {
        
        if year % 400 == 0 {
            return true
        }
        
        return false
        
    }
    
}
