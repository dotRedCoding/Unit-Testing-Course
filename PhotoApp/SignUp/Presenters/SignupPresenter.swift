//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Jared on 2023-04-02.
//

import Foundation

class SignupPresenter {
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var webservice: SignupWebServiceProtocol
    
    init(formModelValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol) {
        self.formModelValidator = formModelValidator
        self.webservice = webservice
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        
        if !formModelValidator.isFirstNameValid(firstName: formModel.firsName) {
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
    
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            return
        }
        
        if !formModelValidator.isEmailValid(email: formModel.email) {
            return
        }
        
        let requestModel = SignUpFormRequestModel(firstName: formModel.firsName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        webservice.signup(withForm: requestModel) { (responseModel, error) in
            //TODO: write body
        }
    }
    
}
