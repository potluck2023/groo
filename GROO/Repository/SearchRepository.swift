//
//  SearchRepository.swift
//  GROO
//
//  Created by 이예주 on 2023/07/18.
//

import Foundation

protocol SearchRepositoryProtocol {
    func getSearch(title: String?) async throws -> BookList
}

extension SearchRepositoryProtocol {
    func getSearch(title: String? = nil) async throws -> BookList {
        try await getSearch(title: title)
    }
}

class SearchRepository: SearchRepositoryProtocol {
    // MARK: 검색
    /// 정보나루 open API
    func getSearch(title: String?) async throws -> BookList {
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "authKey", value: Config.libraryAPIKey))
        queryItems.append(URLQueryItem(name: "format", value: "json"))
        if let title {
            queryItems.append(URLQueryItem(name: "title", value: "\(title.replacingOccurrences(of: " ", with: ""))"))
        }
        let endpoint = Endpoint.searchBook(query: queryItems)

        let urlRequest = URLRequest(url: endpoint.library, method: .get)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        try APIService().checkResponse(response: response, data: data)
        
        guard let result = try APIService().decode(LibraryResponse.self, from: data) else { return BookList(totalCount: 0, contents: []) }
        
        let totalBookCount: Int = result.response.numFound
        let books: [Book] = result.response.docs.map { $0.doc }.filter { !$0.image.isEmpty }
        
        return BookList(totalCount: totalBookCount, contents: books)
    }
}
