//
//  SearchData.swift
//  GROO
//
//  Created by 이예주 on 2023/07/18.
//

import SwiftUI

@MainActor
class SearchData: ObservableObject {
    @Published private var books: [Book]
    
    enum Action {
        case search(text: String)
    }
    
    private let searchRepository: SearchRepositoryProtocol
    
    init(
        books: [Book] = [],
        searchRepository: SearchRepositoryProtocol = SearchRepository()
    ) {
        self.books = books
        self.searchRepository = searchRepository
    }
    
    func process(_ action: Action) {
        switch action {
        case let .search(text):
            Task { await search(text) }
        }
    }
}

extension SearchData {
    private func search(_ text: String) async {
        do {
            let response = try await searchRepository.getSearch(query: text)
            
            books = response.items
            
            print("books: \(books)")
        } catch let error as NaverError {
            print("error: \(error)")
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
}
