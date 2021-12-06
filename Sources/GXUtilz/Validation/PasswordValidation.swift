//
//  File.swift
//  
//
//  Created by Danil on 06.12.2021.
//

import Foundation
// TODO: - documentation
public class PasswordValidation: Validation {
    
    private var passwordPredicate: NSPredicate {
        buildPredicate("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}")
    }
    
    func validatePassword(with value: String) -> Bool {
        isValid(with: passwordPredicate, and: value)
    }
}
