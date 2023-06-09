//
//  SignUpConstants.swift
//  PhotoApp
//
//  Created by Jared on 2023-03-29.
//

import Foundation

struct SignUpConstants {
    static let firstNameMinLength = 2
    static let firstNameMaxLength = 10
    
    static let lastNameMinLength = 2
    static let lastNameMaxLength = 20
    
    static let passwordMinLength = 5
    static let passwordMaxLength = 20
    
    static let signUpURLString: String = "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users"

}
