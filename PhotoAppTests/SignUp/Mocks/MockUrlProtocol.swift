//
//  MockUrlProtocol.swift
//  PhotoAppTests
//
//  Created by Jared on 2023-04-01.
//

import Foundation

class MockUrlProtocol: URLProtocol {
    // provide implementation
    
    static var stubResponseData: Data?
    static var error: Error?
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        // instead of loading a real request we will hardcord pre defined data for testing
        
        
        if let signUpError = MockUrlProtocol.error {
            self.client?.urlProtocol(self, didFailWithError: signUpError)
        } else {
            self.client?.urlProtocol(self, didLoad: MockUrlProtocol.stubResponseData ?? Data())// the did load data will be injected instead of hardcoded 
        }
       
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() { }
}
