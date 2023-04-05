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
    
    func signup(withForm formModel: PhotoApp.SignUpFormRequestModel, completionHandler: @escaping (PhotoApp.SignUpResponseModel?, PhotoApp.SignupError?) -> Void) {
        isSignupMethodCalled = true
    }
    
    
    
    
    
}
