//
//  SearchRepository.swift
//  GROO
//
//  Created by 이예주 on 2023/07/18.
//

import Foundation

protocol SearchRepositoryProtocol {
    func getSearch(title: String?, author: String?, isbn13: Int?, keyword: String?, sort: String?, order: String?, exactMatch: String?, pageNo: Int?, pageSize: Int?) async throws -> BookListObject
    func getSearchDetail(isbn13: Int) async throws
}

extension SearchRepositoryProtocol {
    func getSearch(title: String? = nil, author: String? = nil, isbn13: Int? = nil, keyword: String? = nil, sort: String? = nil, order: String? = nil, exactMatch: String? = nil, pageNo: Int? = nil, pageSize: Int? = nil) async throws -> BookListObject {
        try await getSearch(title: title, author: author, isbn13: isbn13, keyword: keyword, sort: sort, order: order, exactMatch: exactMatch, pageNo: pageNo, pageSize: pageSize)
    }
}

/// 정보나루 open API
final class SearchRepository: SearchRepositoryProtocol {
    // MARK: 검색
    func getSearch(title: String?, author: String?, isbn13: Int?, keyword: String?, sort: String?, order: String?, exactMatch: String?, pageNo: Int?, pageSize: Int?) async throws -> BookListObject {
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "authKey", value: Config.libraryAPIKey))
        queryItems.append(URLQueryItem(name: "format", value: "json"))
        if let title {
            queryItems.append(.init(name: "title", value: "\(title.replacingOccurrences(of: " ", with: ""))"))
        }
        if let author { queryItems.append(.init(name: "author", value: "\(author)"))}
        if let isbn13 { queryItems.append(.init(name: "isbn13", value: "\(isbn13)"))}
        if let keyword { queryItems.append(.init(name: "keyword", value: "\(keyword)"))}
        if let sort { queryItems.append(.init(name: "sort", value: "\(sort)"))}
        if let order { queryItems.append(.init(name: "order", value: "\(order)"))}
        if let exactMatch { queryItems.append(.init(name: "exactMatch", value: "\(exactMatch)"))}
        if let pageNo { queryItems.append(.init(name: "pageNo", value: "\(pageNo)"))}
        if let pageSize { queryItems.append(.init(name: "pageSize", value: "\(pageSize)"))}
        
        let endpoint = Endpoint.searchBook(query: queryItems)
        
        let urlRequest = URLRequest(url: endpoint.library, method: .get)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        try APIService().checkResponse(response: response, data: data)
        
        guard let result = try APIService().decode(BookListObject.self, from: data) else { throw NetworkingError.decodeFail }
        
        return result
    }
}

#if DEBUG
final class StubSearchRepository: SearchRepositoryProtocol {
    func getSearch(title: String?, author: String?, isbn13: Int?, keyword: String?, sort: String?, order: String?, exactMatch: String?, pageNo: Int?, pageSize: Int?) async throws -> BookListObject {
        
        return pageNo == 1 ? .stub1 : .stub2
    }
}
#endif
