//
//  SignUpWebService.swift
//  PhotoApp
//
//  Created by Jared on 2023-03-29.
//

import Foundation

class SignUpWebService {
    
    private var urlString: String
    private var urlSession: URLSession
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignUpFormRequestModel, completionHandler: @escaping(SignUpResponseModel?, SignUpError?) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(nil, SignUpError.invalidRequestURLString)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            // code that will handle the data and response object
            // TODO: Write a unit test to handle an error here
            if let data = data, let signUpResponseModel = try? JSONDecoder().decode(SignUpResponseModel.self, from: data) {
                completionHandler(signUpResponseModel, nil)
            } else {
                completionHandler(nil, SignUpError.invalidResponseModel)
            }
            
        }
        dataTask.resume()
    }
    
}
