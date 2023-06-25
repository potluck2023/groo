//
//  AccountRepository.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/02.
//

import Foundation

protocol AccountRepositoryProtocol {
    func postMailCheck(email: String) async throws
    func postRegister(email: String, password: String, name: String) async throws
    func postLogin(email: String, password: String) async throws
    func postModifyPass(email: String, password: String) async throws
}

class AccountRepository: AccountRepositoryProtocol {
    func postMailCheck(email: String) async throws {
        let endpoint = Endpoint.mailCheck(email: email)
        
//        let body: [String: String] = ["email": email]
//
//        let urlRequest = URLRequest(url: endpoint.url, method: .post(body))
        
        var urlRequest = URLRequest(url: endpoint.url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        try APIService().checkResponse(response: response, data: data)
    }
    
    func postRegister(email: String, password: String, name: String) async throws {
        let endpoint = Endpoint.register
        
        let body: [String: String] = ["userEmail": email, "userPass": password, "nickname": name]
        
        var urlRequest = URLRequest(url: endpoint.url, method: .post(body))
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        try APIService().checkResponse(response: response, data: data)
    }
    
    func postLogin(email: String, password: String) async throws {
        let endpoint = Endpoint.login
        
        let body: [String: String] = ["userEmail": email, "userPass": password]
        
        var urlRequest = URLRequest(url: endpoint.url, method: .post(body))
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        try APIService().checkResponse(response: response, data: data)
    }
    
    func postModifyPass(email: String, password: String) async throws {
        let endpoint = Endpoint.modifyPass
        
        let body: [String: String] = ["userEmail": email, "userPass": password]
        
        var urlRequest = URLRequest(url: endpoint.url, method: .post(body))
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        try APIService().checkResponse(response: response, data: data)
    }
}
