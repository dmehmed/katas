//
//  Rule.swift
//  StringCalculator
//
//  Created by Deniz Mehmed on 6.12.21.
//

protocol Rule {
    func isValid(_ value: Int) throws -> Bool
}
