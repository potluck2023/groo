//
//  APIService.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/23.
//

import Foundation

protocol APIServiceProtocol {
    func checkResponse(response: URLResponse, data: Data) throws
}

class APIService: APIServiceProtocol {
    func checkResponse(response: URLResponse, data: Data) throws {
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            let error = try? JSONDecoder().decode(ErrorMessage.self, from: data)
            
            if let error {
                throw AuthenticationError.custom(error)
            } else {
                throw AuthenticationError.invalidCredentials
            }
        }
    }
}
