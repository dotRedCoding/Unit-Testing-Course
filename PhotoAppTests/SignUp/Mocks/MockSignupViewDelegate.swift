//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by Jared on 2023-04-05.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    
    var expectation: XCTestExpectation?
    var signupCounter = 0
    
    func successfullSignup() {
        signupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: PhotoApp.SignupError) {
        //
    }
    
    
   
    
}


