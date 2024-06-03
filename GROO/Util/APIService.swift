//
//  APIService.swift
//  GROO
//
//  Created by 이예주 on 2023/04/23.
//

import Foundation

protocol APIServiceProtocol {
    func checkResponse(response: URLResponse, data: Data) throws
}

class APIService: APIServiceProtocol {
    func checkResponse(response: URLResponse, data: Data) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw AuthenticationError.invalidCredentials
        }
        
        guard 200..<300 ~= httpResponse.statusCode else {
            let error = try? JSONDecoder().decode(ErrorMessage.self, from: data)
            
            if let error = error {
                throw AuthenticationError.custom(error)
            }
            
            throw AuthenticationError.invalidCredentials
        }
    }
    
    func checkNaverResponse(response: URLResponse, data: Data) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw AuthenticationError.invalidCredentials
        }
        
        guard 200..<300 ~= httpResponse.statusCode else {
            let error = try? JSONDecoder().decode(NaverError.self, from: data)
            
            if let error = error {
                throw error
            }
            
            throw AuthenticationError.invalidCredentials
        }
    }
}
