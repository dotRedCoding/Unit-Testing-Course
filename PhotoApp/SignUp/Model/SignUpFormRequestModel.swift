//
//  SignUpFormRequestModel.swift
//  PhotoApp
//
//  Created by Jared on 2023-03-29.
//

import Foundation

struct SignUpFormRequestModel: Codable {
    
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    
}
