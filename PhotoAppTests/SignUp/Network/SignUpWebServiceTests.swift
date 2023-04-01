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
        let sut = SignUpWebService(urlString: "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users")
        let signUpFormRequestModel = SignUpFormRequestModel(firstName: "Jared", lastName: "Infantino", email: "test@testing.com", password: "password1")
        let expectation = self.expectation(description: "SignUp Web Service Response Expectation")
        
        // Act
        sut.signup(withForm: signUpFormRequestModel) { (signUpResponseModel, error) in
            
            // Assert (still inside a closure here)
            XCTAssertEqual(signUpResponseModel?.status, "ok")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }

}
