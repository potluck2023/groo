//
//  URLRequest+Extension.swift
//  GROO
//
//  Created by 이예주 on 2023/04/23.
//

import Foundation

enum HttpMethod {
    case get
    case post(_ body: Codable)
    case postForm(_ body: Codable)
    case put(_ body: Codable)
    case delete(_ body: Codable)
    case patch(_ body: Codable)
    case patchForm(_ body: Codable)
}

extension URLRequest {
    init(url: URL, method: HttpMethod) {
        self.init(url: url)
        self.timeoutInterval = TimeInterval(10)
        
        switch method {
        case .get:
            self.httpMethod = "GET"
        case .post(let body):
            self.httpMethod = "POST"
            self.addValue("application/json", forHTTPHeaderField: "content-type")
            self.httpBody = try? JSONEncoder().encode(body)
        case .postForm(let body):
            self.httpMethod = "POST"
            self.httpBody = body as? Data
        case .put(let body):
            self.httpMethod = "PUT"
            self.addValue("application/json", forHTTPHeaderField: "content-type")
            self.httpBody = try? JSONEncoder().encode(body)
        case .delete(let body):
            self.httpMethod = "DELETE"
            self.addValue("application/json", forHTTPHeaderField: "content-type")
            self.httpBody = try? JSONEncoder().encode(body)
        case .patch(let body):
            self.httpMethod = "PATCH"
            self.addValue("application/json", forHTTPHeaderField: "content-type")
            self.httpBody = try? JSONEncoder().encode(body)
        case .patchForm(let body):
            self.httpMethod = "PATCH"
            self.httpBody = body as? Data
        }
    }
}
