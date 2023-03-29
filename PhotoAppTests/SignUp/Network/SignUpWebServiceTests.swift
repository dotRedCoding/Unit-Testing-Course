//
//  SignUpWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Jared on 2023-03-29.
//

import XCTest
@testable import PhotoApp // do not forget this step otherwise you cannot see files for testing

final class SignUpWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignUpWebService_GivenSuccessfulResponse_ReturnsSuccess() {
        // Arrange
        let sut = SignUpWebService()
        let signUpFormRequestModel = SignUpFormRequestModel(firstName: "Jared", lastName: "Infantino", email: "test@testing.com", password: "password1")
        
        
        // Act
        sut.signup(withForm: signUpFormRequestModel) { (signUpResponseModel, error) in
            
        }
        
        // Assertion
    }

}
