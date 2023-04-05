//
//  SignupViewControllersTests.swift
//  PhotoAppTests
//
//  Created by Jared on 2023-04-05.
//

import XCTest
@testable import PhotoApp

final class SignupViewControllersTests: XCTestCase {
    
    var storyboard: UIStoryboard!
    var sut: SignupViewController!
    
    override func setUpWithError() throws {
        
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        storyboard = nil
        sut = nil
    }

    func testSignupViewController_WhenCreated_HasRequiredTextFieldsEmpty() {
   
        
        // Assert
        XCTAssertEqual(sut?.firstNameTextField.text, "", "First name text field was not empty when the view controller loaded")
        XCTAssertEqual(sut?.lastNameTextField.text, "", "Last name text field was not empty when the view controller loaded")
        XCTAssertEqual(sut?.emailTextField.text, "", "Email text field was not empty when the view controller loaded")
        XCTAssertEqual(sut?.passwordTextField.text, "", "Password text field was not empty when the view controller loaded")
        XCTAssertEqual(sut?.repeatPasswordTextField.text, "", "Repeat Password text field was not empty when the view controller loaded")
    }

}
