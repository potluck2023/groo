//
//  RegisterViewModelTests.swift
//  GROOTests
//
//  Created by 이예주 on 2023/04/23.
//

import XCTest
@testable import GROO

final class RegisterViewModelTests: XCTestCase {
    private var sut: MockAccountRepository!
    private var expectation: XCTestExpectation!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MockAccountRepository()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        expectation = nil
        try super.tearDownWithError()
    }
    
    func test이메일_전송_성공() async throws {
        expectation = XCTestExpectation(description: "이메일 전송 성공")
        // given
        let email = "iosTest@ruu.kr"
        
        // when
        try await sut.postMailCheck(email: email)
        
        // then
        
    }
    
    func test이메일_인증_성공() async throws {
        expectation = XCTestExpectation(description: "이메일 인증 성공")
        
        // given
        let code = "123456"
        
        // when
        
        // then
    }
}
