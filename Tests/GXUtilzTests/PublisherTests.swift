//
//  File.swift
//  
//
//  Created by Danil on 03.12.2021.
//

import Foundation
import XCTest
import UIKit
@testable import GXUtilz

final class PublishersTest: XCTestCase {
    
    @EmailPublished var testEmail: String = ""
    
    
    @NamesPublished var username: String = ""
    @NamesPublished var lastName: String = ""
    @NamesPublished var middleName: String = ""
    
    
    @PasswordPublished var password: String = ""
    
    
    // MARK: - email
    
    func testIncorrectEmailPublished() {
        testEmail = "123@"
        let _ = $testEmail
            .sink { isValid in
                XCTAssertFalse(isValid)
            }
    }
    
    func testCorrectEmailPublished() {
        testEmail = "123@mail.com"
        debugPrint("\(#function)", testEmail)
        let _ = $testEmail
            .sink { isValid in
                XCTAssert(isValid)
            }
    }
    
    // MARK: - names
    
    func testIncorrectNamesPublished() {
        username = "123@"
        lastName = "Ф"
        middleName = "DROP DATABASE;"
        
        debugPrint("\(#function)", username)
        debugPrint("\(#function)", lastName)
        debugPrint("\(#function)", middleName)
        let _ = $username
            .sink { isValid in
                XCTAssertFalse(isValid)
            }
        
        let _ = $lastName
            .sink { isValid in
                XCTAssertFalse(isValid)
            }
        
        let _ = $middleName
            .sink { isValid in
                XCTAssertFalse(isValid)
            }
    }
    
    func testCorrectNamesPublished() {
        username = "Ян"
        lastName = "Толлмаш-Толлмаш де Ореллана-Плантагенет-Толлмаш-Толлмаш"
        middleName = "Иванович"
        
        debugPrint("\(#function)", username)
        debugPrint("\(#function)", lastName)
        debugPrint("\(#function)", middleName)
        let _ = $username
            .sink { isValid in
                XCTAssert(isValid)
            }
        
        let _ = $lastName
            .sink { isValid in
                XCTAssert(isValid)
            }
        
        let _ = $middleName
            .sink { isValid in
                XCTAssert(isValid)
            }
    }
    
    // MARK: pass
    
    func testIncorrectPasswordPublishedWithNumbers() {
        password = "12345"
        let _ = $password
            .sink { isValid in
                XCTAssertFalse(isValid)
            }
    }
    
    func testIncorrectPasswordPublishedWithLetters() {
        password = "qwerty7"
        let _ = $password
            .sink { isValid in
                XCTAssertFalse(isValid)
            }
    }
    
    
    func testCorrectPasswordPublished() {
        password = "Strong_Password!123"
        let _ = $password
            .sink { isValid in
                XCTAssert(isValid)
            }
    }
}
