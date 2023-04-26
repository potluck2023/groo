//
//  AccountRepository.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/02.
//

import Foundation

protocol AccountRepositoryProtocol {
    func postMailCheck(email: String) async throws
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
        
        print("url: \(endpoint.url)")
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        try APIService().checkResponse(response: response, data: data)
    }
}
