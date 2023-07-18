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
}

struct ErrorMessage: Codable, Error {
    let fail: Int
    let message: String
    
    private enum CodingKeys: String, CodingKey {
        case fail, message
    }
}
