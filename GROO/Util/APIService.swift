//
//  APIService.swift
//  GROO
//
//  Created by 이예주 on 2023/04/23.
//

import Foundation

protocol APIServiceProtocol {
    func checkResponse(response: URLResponse, data: Data) throws
}

class APIService: APIServiceProtocol {
    func checkResponse(response: URLResponse, data: Data) throws {
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            let error = try? JSONDecoder().decode(ErrorMessage.self, from: data)
            
            if let error {
                throw AuthenticationError.custom(error)
            } else {
                throw AuthenticationError.invalidCredentials
            }
        }
    }
    
    func decode<T: Codable>(_ resultType: T.Type, from data: Data) throws -> T? {
        do {
            let decodedData = try JSONDecoder().decode(resultType.self, from: data)
            return decodedData
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("[\(resultType)]Key '\(key)' not found:", context.debugDescription)
            print("[\(resultType)]codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("[\(resultType)]Value '\(value)' not found:", context.debugDescription)
            print("[\(resultType)]codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context) {
            print("[\(resultType)]Type '\(type)' mismatch:", context.debugDescription)
            print("[\(resultType)]codingPath:", context.codingPath)
        } catch {
            print("[\(resultType)]error: ", error)
        }
        
        return nil
    }
}
