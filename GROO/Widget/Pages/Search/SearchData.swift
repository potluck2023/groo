//
//  SearchData.swift
//  GROO
//
//  Created by 이예주 on 2023/07/18.
//

import SwiftUI

class SearchData: ObservableObject {
    @Published private(set) var books: [Book] = []
    @Published private(set) var totalBookCount: Int = -1
    
    @Published var searchType: BookSearchType = .title
    
    @Published private(set) var isLastBook: Bool = true
    
    private var isLoading: Bool = false
    
    enum Action {
        case searchWithTitle(_ title: String, page: Int = 1)
        case searchWithAuthor(_ author: String, page: Int = 1)
        case searchWithISBN(_ isbn: String, page: Int = 1)
    }
    
    private(set) var pageIndex: Int = 1
    private let pageSize: Int = 20
    
    private let searchRepository: SearchRepositoryProtocol
    
    init(searchRepository: SearchRepositoryProtocol = SearchRepository()) {
        self.searchRepository = searchRepository
    }
    
    func process(_ action: Action) {
        switch action {
        case let .searchWithTitle(title, page):
            Task { await search(title: title, page: page) }
        case let .searchWithAuthor(author, page):
            Task { await search(author: author, page: page) }
        case let .searchWithISBN(isbn, page):
            Task {
                guard let isbn13 = Int(isbn) else {
                    // TODO: error
                    return
                }
                
                await search(isbn13: isbn13, page: page)
            }
        }
    }
}

extension SearchData {
    @MainActor
    private func search(title: String? = nil, author: String? = nil, isbn13: Int? = nil, keyword: String? = nil, sort: BookSortType = .loan, order: BookOrderType = .desc, page: Int = 1) async {
        guard !isLoading else { return }
        
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            let response = try await searchRepository.getSearch(title: title, author: author, isbn13: isbn13, keyword: keyword, sort: sort.rawValue, order: order.rawValue, pageNo: page, pageSize: pageSize)
            
            let books = response.docs.map { $0.toModel() }
            
            if page == 1 {
                self.books = books
                totalBookCount = response.numFound
            } else {
                self.books.append(contentsOf: books)
            }
            
            pageIndex = page + 1
            isLastBook = books.count < pageSize
        } catch let error as NetworkingError {
            // TODO: error case
            print("error: \(error.localizedDescription)")
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
}

enum BookSearchType: DropdownMenu {
    case title
    case author
    case isbn
    
    var label: LocalizedStringKey {
        switch self {
        case .title:
            return "title"
        case .author:
            return "author"
        case .isbn:
            return "ISBN"
        }
    }
}

enum BookSortType: String {
    case title
    case author
    case publisher = "pub"
    case publicationYear = "pubYear"
    case isbn
    case loan
}

enum BookOrderType: String {
    case asc
    case desc
}
