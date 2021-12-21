//
//  File.swift
//  
//
//  Created by Danil on 03.12.2021.
//

import Foundation
// TODO: - documentation
public protocol Validation {
    func buildPredicate(_ regExp: String) -> NSPredicate
    
    func isValid(with predicate: NSPredicate, and value: String) -> Bool
}

public extension Validation {
    func buildPredicate(_ regExp: String) -> NSPredicate {
        let validator = NSPredicate(format: "SELF MATCHES[c] %@", regExp)
        return validator
    }

    func isValid(with predicate: NSPredicate, and value: String) -> Bool {
        return predicate.evaluate(with: value)
    }
}
