//
//  SignupViewController.swift
//  PhotoApp
//
//  Created by Jared on 2023-04-05.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton?
    
    var signupPresenter: SignupPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if signupPresenter == nil {
            let signupModelValidator = SignUpFormModelValidator()
            let signupWebService = SignUpWebService(urlString: SignUpConstants.signUpURLString)
            let
            signupPresenter = SignupPresenter(formModelValidator: signupModelValidator, webservice: signupWebService, delegate: self)
        }
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        
        let signupFormModel = SignupFormModel(firsName: firstNameTextField.text ?? "",
                                              lastName: lastNameTextField.text ?? "",
                                              email: emailTextField.text ?? "",
                                              password: passwordTextField.text ?? "",
                                              repeatPassword: repeatPasswordTextField.text ?? "")
        
        signupPresenter?.processUserSignup(formModel: signupFormModel)
    }
    
}

extension SignupViewController: SignupViewDelegateProtocol {
    
    func successfullSignup() {
        // TODO:
    }
    
    func errorHandler(error: SignupError) {
        //TODO:
    }
    
    
}
