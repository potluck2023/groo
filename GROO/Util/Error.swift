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

struct NaverError: Decodable, Error {
    let code: String
    let message: String
    
    private enum CodingKeys: String, CodingKey {
        case code = "errorCode"
        case message = "errorMessage"
    }
}
