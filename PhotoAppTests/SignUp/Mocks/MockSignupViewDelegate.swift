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
    
    func successfullSignup() {
        expectation?.fulfill()
    }
    
    func errorHandler(error: PhotoApp.SignupError) {
        //
    }
    
    
   
    
}


