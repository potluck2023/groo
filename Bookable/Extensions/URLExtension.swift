//
//  URLExtension.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/23.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
//        let LOCAL_TEST_URL = "http://:8080"
        let API_URL = "129.154.51.20"
        
        // local host
//        var url = URL(string: LOCAL_TEST_URL)!
//
//        url = url.appendingPathComponent(path)
//        if #available(iOS 16.0, *) {
//            url.append(queryItems: queryItems)
//        } else {
//
//        }
        
        var components = URLComponents()
        components.scheme = "http"
        components.host = API_URL
        components.port = 8080
        components.path = path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
}

extension Endpoint {
    // MARK: - account
    static func mailCheck(email: String) -> Self {
        Endpoint(path: "/mailCheck/\(email)")
    }
    
    static var login: Self {
        Endpoint(path: "/login")
    }
    
    static var memberInfo: Self {
        Endpoint(path: "/memberInfo")
    }
    
    static var modifyPass: Self {
        Endpoint(path: "/modifyPass")
    }
    
    static var register: Self {
        Endpoint(path: "/register")
    }
}
