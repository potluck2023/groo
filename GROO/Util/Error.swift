//
//  ErrorExtension.swift
//  GROO
//
//  Created by 이예주 on 2023/04/23.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(ErrorMessage)
    case naver(NaverError)
}

struct ErrorMessage: Codable, Error {
    let fail: Int
    let message: String
    
    private enum CodingKeys: String, CodingKey {
        case fail, message
    }
}

enum NetworkingError: LocalizedError {
    case badURLResponse
    case serverError
    case decodeFail
    case unknown
    
    // TODO: error message
    var errorDescription: String? {
        switch self {
        case .badURLResponse: return "Bad response from URL"
        case .serverError: return "ServerError"
        case .decodeFail: return "decode fail"
        case .unknown: return "Unknown error occured"
        }
    }
}

struct NaverError: Decodable, Error {
    let code: String
    let message: String
    
    private enum CodingKeys: String, CodingKey {
        case code = "errorCode"
        case message = "errorMessage"
    }
}
