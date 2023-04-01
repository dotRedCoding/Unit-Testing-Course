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
//        let expectation = self.expectation(description: "signup() method expectation for a response that contains a different JSON structure")
//
//        // Act
//        sut.signup(withForm: signUpFormRequestModel) { (signUpResponseModel, error) in
//
//            // Assert
//            XCTAssertNil(signUpResponseModel, "The Response model for a request containing unknown JSON response, should have been nil") // expecting signUpResponseModel to be nil
//            XCTAssertEqual(error, SignUpErrors.responseModelParsingError, "The signup() method did not return expected error")
//            expectation.fulfill()
//        }
//        self.wait(for: [expectation], timeout: 5)
//    }
    
    func testSignUpWebService_WhenEmptyURLStringProvided_ReturnsError() {
        // Arrange
        
        let expectation = self.expectation(description: "An empty request URL string expectation")
        
        sut = SignUpWebService(urlString: "")
        
        // Act
        sut.signup(withForm: signUpFormRequestModel) { signUpResponseModel, error in
            // Assert
            XCTAssertEqual(error, SignUpError.invalidRequestURLString, "The signup() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(signUpResponseModel, "When an invalidRequestURLString takes place, the response model must be nil")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
        
    }
    
}
