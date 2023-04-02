//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Jared on 2023-04-02.
//

import XCTest
@testable import PhotoApp

final class SignupPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Arrange
        let signupFormModel = SignupFormModel(
            firsName: "Jared",
            lastName: "Infantino",
            email: "jared@jared.com",
            password: "1234567",
            repeatPassword: "1234567")
        
        let mockSignupModelValidator = MockSignupModelValidator()
        
        let sut = SignupPresenter(formModelValidator: mockSignupModelValidator)
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "firsName was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "lastName was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "password was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "passwordEquality was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "email format was not validated")
    }
    

}
