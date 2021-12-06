//
//  Validator.swift
//  StringCalculator
//
//  Created by Deniz Mehmed on 6.12.21.
//

protocol Validator {
    func add(rule: Rule)
    func isValid(_ value: Int) throws -> Bool
}
