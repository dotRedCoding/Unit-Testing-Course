//
//  MockSignupWebService.swift
//  PhotoAppTests
//
//  Created by Jared on 2023-04-05.
//

import Foundation
@testable import PhotoApp

class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    
    func signup(withForm formModel: PhotoApp.SignUpFormRequestModel, completionHandler: @escaping (PhotoApp.SignUpResponseModel?, PhotoApp.SignupError?) -> Void) {
        
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, SignupError.failedRequest(description: "Signup request was not successfull"))
        } else {
            let responseModel = SignUpResponseModel(status: "Ok")
            completionHandler(responseModel, nil)
        }
    }
    
    
    
    
    
}
