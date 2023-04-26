//
//  MockError.swift
//  BookableTests
//
//  Created by 이예주 on 2023/04/23.
//

@testable import Bookable

extension ErrorMessage {
    static func mock(fail: Int = 400, message: String = "") -> ErrorMessage {
        return ErrorMessage(fail: fail, message: message)
    }
}
