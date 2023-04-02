//
//  MockSignupModelValidator.swift
//  PhotoAppTests
//
//  Created by Jared on 2023-04-02.
//

import Foundation
@testable import PhotoApp // REMEMBER TO ADD THIS

class MockSignupModelValidator: SignupModelValidatorProtocol {
    
    var isFirstNameValidated: Bool = false
    var isLastNameValidated: Bool = false
    var isPasswordValidated: Bool = false
    var isPasswordEqualityValidated: Bool = false
    var isEmailValidated: Bool = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        isPasswordEqualityValidated = true
        return isPasswordEqualityValidated
    }
    
    func isEmailValid(email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }
    
}
