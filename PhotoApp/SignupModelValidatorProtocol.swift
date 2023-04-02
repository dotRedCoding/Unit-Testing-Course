//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Jared on 2023-04-02.
//

import Foundation
// must contain properties that both the real and mock implementations should use

protocol SignupModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool
    func isLastNameValid(lastName: String) -> Bool
    
    func isPasswordValid(password: String) -> Bool
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
    
    func isEmailValid(email: String) -> Bool
}
