//
//  SignUpWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Jared on 2023-03-29.
//

import XCTest
@testable import PhotoApp // do not forget this step otherwise you cannot see files for testing

final class SignUpWebServiceTests: XCTestCase {
    
    var sut: SignUpWebService!
    var signUpFormRequestModel: SignUpFormRequestModel!

    override func setUpWithError() throws {
        let config = URLSessionConfiguration.ephemeral // ephemeral is sesson configuration that does not use persistent storage for caching/cookies/credentials
        config.protocolClasses = [MockUrlProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        sut = SignUpWebService(urlString: SignUpConstants.signUpURLString , urlSession: urlSession)
        signUpFormRequestModel = SignUpFormRequestModel(firstName: "Jared", lastName: "Infantino", email: "test@testing.com", password: "password1")
      
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        signUpFormRequestModel = nil
        MockUrlProtocol.stubResponseData = nil
        
    }

    func testSignUpWebService_GivenSuccessfulResponse_ReturnsSuccess() {
     
        // Arrange
        let jsonString = "{\"status\":\"ok\"}" // double check the formatting here
        MockUrlProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "SignUp Web Service Response Expectation")
        
        // Act
        sut.signup(withForm: signUpFormRequestModel) { (signUpResponseModel, error) in
            
            // Assert (still inside a closure here)
            XCTAssertEqual(signUpResponseModel?.status, "ok")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
//    func testSignUpWebService_RecievedDifferentJSONResponse_WithError() {
//
//        let jsonString = "{\"path\":\"/users\", Í\"error\":\"Internal Server Error\"}" // different JSON string that the code is not prepared to handle
//        MockUrlProtocol.stubResponseData = jsonString.data(using: .utf8)
//        
//        let expectation = self.expectation(description: "SignUp Web Service Response Expectation")
//        
//        // Act
//        sut.signup(withForm: signUpFormRequestModel) { (signUpResponseModel, error) in
//            
//            // Assert (still inside a closure here)
//            XCTAssertNil(signUpResponseModel) // expecting signUpResponseModel to be nil
//            XCTAssertEqual(error, SignUpErrors.responseModelParsingError)
//            expectation.fulfill()
//        }
//        self.wait(for: [expectation], timeout: 5)
//    }
}
