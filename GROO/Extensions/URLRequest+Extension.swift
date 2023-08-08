//
//  URLRequest+Extension.swift
//  GROO
//
//  Created by 이예주 on 2023/04/23.
//

import Foundation

enum HttpMethod<Body> {
    case get
    case getNaver
    case post(Body?)
    case postForm(Body?)
    case put(Body)
    case delete(Body?)
    case patch(Body)
    case patchForm(Body?)
}

extension URLRequest {
    init<Body: Codable> (url: URL, method: HttpMethod<Body>) {
        self.init(url: url)
        self.timeoutInterval = TimeInterval(10)
        
        switch method {
        case .get:
            self.httpMethod = "GET"
        case .getNaver:
            self.httpMethod = "GET"
            self.addValue("X-Naver-Client-Id", forHTTPHeaderField: "hTtuI5V7tXcLQFKzVbpb")
            self.addValue("X-Naver-Client-Secret", forHTTPHeaderField: "6Ns6aTsWC0")
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
