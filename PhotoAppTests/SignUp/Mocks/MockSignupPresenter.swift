//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by Jared on 2023-04-05.
//

import Foundation
@testable import PhotoApp

class MockSignupPresenter: SignupPresenterProtocol {
    var proccessUserSignupCalled: Bool = false
    
    required init(formModelValidator: PhotoApp.SignupModelValidatorProtocol, webservice: PhotoApp.SignupWebServiceProtocol, delegate: PhotoApp.SignupViewDelegateProtocol) {
        // TODO:
    }
    
    func processUserSignup(formModel: PhotoApp.SignupFormModel) {
        proccessUserSignupCalled = true
    }
    
    
    
    
}
