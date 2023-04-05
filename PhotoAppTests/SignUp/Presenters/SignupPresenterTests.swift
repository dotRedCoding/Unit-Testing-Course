//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Jared on 2023-04-02.
//

import XCTest
@testable import PhotoApp

final class SignupPresenterTests: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter!
    
    override func setUpWithError() throws {
        signupFormModel = SignupFormModel(
            firsName: "Jared",
            lastName: "Infantino",
            email: "jared@jared.com",
            password: "1234567",
            repeatPassword: "1234567")
        
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator, webservice: mockSignupWebService)
       
    }

    override func tearDownWithError() throws {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
    }

    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Arrange
    
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "firsName was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "lastName was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "password was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "passwordEquality was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "email format was not validated")
    }
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        // Arrange

        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "signup() method was not called in the SignupWebService class")
        
    }

    func testSignupPresenter_WhenSignupOperationSuccessful_CallsSuccessOnViewDelegate() {
        // Arrange
        
        // Act
        
        // Assert
    }
}
