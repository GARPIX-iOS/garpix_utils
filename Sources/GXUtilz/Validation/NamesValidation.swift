//
//  File.swift
//  
//
//  Created by Danil on 03.12.2021.
//

import Foundation
// TODO: - documentation
public class NamesValidation: Validation {
    
    private var namesPredicate: NSPredicate {
        buildPredicate("[А-Яа-яЁёA-Za-z\\s-]{2,255}")
    }
    
    func validateName(with value: String) -> Bool {
        isValid(with: namesPredicate, and: value)
    }
}
