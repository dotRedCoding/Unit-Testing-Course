//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by Jared on 2023-04-05.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    
    func successfullSignup()
    func errorHandler(error: SignupError)
}

