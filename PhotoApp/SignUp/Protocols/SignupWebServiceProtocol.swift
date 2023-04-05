//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Jared on 2023-04-05.
//

import Foundation

protocol SignupWebServiceProtocol {
    
    func signup(withForm formModel: SignUpFormRequestModel, completionHandler: @escaping (SignUpResponseModel?, SignupError?) -> Void)
}
