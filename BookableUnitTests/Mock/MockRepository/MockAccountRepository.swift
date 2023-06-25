//
//  MockAccountRepository.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/23.
//

import Foundation

final class MockAccountRepository: AccountRepositoryProtocol {
    private let mockErrorMessage: ErrorMessage?
    
    init(error: ErrorMessage? = nil) {
        self.mockErrorMessage = error
    }
    
    func postMailCheck(email: String) async throws {
        if let mockErrorMessage {
            throw AuthenticationError.custom(mockErrorMessage)
        }
    }
    
    func postLogin(email: String, password: String) async throws {
        if let mockErrorMessage {
            throw AuthenticationError.custom(mockErrorMessage)
        }
    }
    
    func postRegister(email: String, password: String, name: String) async throws {
        if let mockErrorMessage {
            throw AuthenticationError.custom(mockErrorMessage)
        }
    }
    
    func postModifyPass(email: String, password: String) async throws {
        if let mockErrorMessage {
            throw AuthenticationError.custom(mockErrorMessage)
        }
    }
}
