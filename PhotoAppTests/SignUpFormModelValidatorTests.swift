//
//  SignUpFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Jared on 2023-03-29.
//



import XCTest
@testable import PhotoApp

final class SignUpFormModelValidatorTests: XCTestCase {
    
    var sut: SignUpFormModelValidator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = SignUpFormModelValidator()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class. "Release Resources"
        
        sut = nil
        
        
    }
    
    //MARK: - First Name Validation
    
    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // Arrange
        // sut = System Under Test
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Jared")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned false") // if the act of firstNameValid is = true the assert will pass
    }
    
    func testSignUpFormModelValidator_WhenFirstNameTooShort_ShouldReturnFalse() {
        // Arrange
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "J")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirtNameValid() should have returned FALSE for a first name that is shorter than \(SignUpConstants.firstNameMinLength) characters but it has returned TRUE")
    }
    
    func testSignUpFormModelValidator_WhenFirstNameTooLong_ShouldReturnFalse() {
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "JaredJaredJ")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "The isFirtNameValid() should have returned FALSE for a first name that is longer than \(SignUpConstants.firstNameMaxLength) characters but it has returned TRUE")
    }
    
    //MARK: - Last Name Validation
    
    func testSignFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        // Arrange
        
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Infantino")
        
        // Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but returned false") // if the act of lastNameValid is = true the assert will pass
    }
    
    func testSignUpFormModelValidator_WhenLastNameTooShort_ShouldReturnFalse() {
        // Arrange

        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "I")

        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is shorter than \(SignUpConstants.lastNameMinLength) characters but it has returned TRUE")
    }

    func testSignUpFormModelValidator_WhenLastNameTooLong_ShouldReturnFalse() {
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "InfantinoInfantinoInfantino")

        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is longer than \(SignUpConstants.lastNameMaxLength) characters but it has returned TRUE")
    }
    
    //MARK: - Password Valididation
    
    func testSignUpFormModelValidator_WhenValidPassordProvided_ShouldReturnTrue() {
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "password")

        // Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned TRUE if a password was entered but it returned FALSE ")
    }
    
    func testSignUpFormModelValidator_WhenPassordProvidedTooShort_ShouldReturnFalse() {
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "pass")

        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password shorter than \(SignUpConstants.passwordMinLength) but it has returned TRUE ")
    }
    
    func testSignUpFormModelValidator_WhenPassordProvidedTooLong_ShouldReturnFalse() {
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "passwordpasswordpassword")

        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password longer than \(SignUpConstants.passwordMaxLength) but it has returned TRUE ")
    }
    
    func testSignUpFormModelValidator_WhenEqualPasswordsProvided_ShouldReturntrue() {
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "password123", repeatPassword: "password123")
        
        // Assert
        XCTAssertTrue(doPasswordsMatch, "The doPasswordsMatch() should have returned TRUE if the passwords are the same but it has returned FALSE")
    }
    
    func testSignUpFormModelValidator_WhenNonMatchingPasswordsProvided_ShouldReturnFalse() {
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "11111111", repeatPassword: "22222222")
        
        // Assert
        XCTAssertFalse(doPasswordsMatch, "The doPasswordsMatch() should have returned FALSE if the passwords are not equal but it has returned TRUE")
    }
    
  //MARK: - Email Validation
    
    func testSignUpFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        
        // Act
        let isEmailValid = sut.isEmailValid(email: "test@test.com")

        // Assert
       XCTAssertTrue(isEmailValid, "Provided valid email address fromat but validation did not pass")
    }
    
    func testSignUpFormModelValidator_WhenInValidEmailProvided_ShouldReturnFalse() {
        
        // Act
        let isEmailValid = sut.isEmailValid(email: "test@test")

        // Assert
       XCTAssertFalse(isEmailValid, "Provided invalid email address fromat but validation still pass")
    }

    
    
}
