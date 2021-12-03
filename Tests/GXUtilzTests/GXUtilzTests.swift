    import XCTest
    import UIKit
    @testable import GXUtilz

    final class GXUtilzTests: XCTestCase {
        
        @EmailPublished var testEmail: String = ""
        
        func testExample() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
            //XCTAssertEqual()
        }
        
        func testIncorrectEmailPublished() {
            testEmail = "123@"
            let _ = $testEmail
                .print()
                .sink { isValid in
                    XCTAssertFalse(isValid)
                }
        }
        
        func testCorrectEmailPublished() {
            testEmail = "123@mail.com"
            let _ = $testEmail
                .print()
                .sink { isValid in
                    XCTAssert(isValid)
                }
        }
    }
