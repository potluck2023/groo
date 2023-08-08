//
//  SearchRepository.swift
//  GROO
//
//  Created by 이예주 on 2023/07/18.
//

import Foundation

protocol SearchRepositoryProtocol {
    func getSearch(query: String, display: Int?, start: Int?, sort: String?) async throws -> BookList
}

extension SearchRepositoryProtocol {
    func getSearch(query: String, display: Int? = nil, start: Int? = nil, sort: String? = nil) async throws -> BookList {
        try await getSearch(query: query, display: display, start: start, sort: sort)
    }
}

class SearchRepository: SearchRepositoryProtocol {
    // MARK: 검색
    /// naver open API
    /// display: 한 번에 표시할 검색 결과 개수(기본값: 10, 최댓값: 100)
    /// start: 검색 시작 위치(기본값: 1, 최댓값: 1000)
    /// sort: 검색 결과 정렬 방법
    ///    - sim: 정확도순으로 내림차순 정렬(기본값)
    ///    - date: 출간일순으로 내림차순 정렬
    func getSearch(query: String, display: Int?, start: Int?, sort: String?) async throws -> BookList {
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "query", value: "\(query)"))
        if let display { queryItems.append(URLQueryItem(name: "display", value: "\(display)")) }
        if let start { queryItems.append(URLQueryItem(name: "start", value: "\(start)")) }
        if let sort { queryItems.append(URLQueryItem(name: "sort", value: "\(sort)")) }
        let endpoint = Endpoint.search(query: queryItems)
        
        guard var urlRequest = try? URLRequest(url: endpoint.naver, method: .getNaver) else { throw URLError(.badURL) }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        try APIService().checkResponse(response: response, data: data)
        
        return try JSONDecoder().decode(BookList.self, from: data)
    }
}
