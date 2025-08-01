//
//  SearchDetailData.swift
//  GROO
//
//  Created by isabella joo on 6/4/24.
//

import Foundation

final class SearchDetailData: ObservableObject {
    @Published private var book: Book = .init()
    
    enum Action {
        
    }
    
    private let isbn: Int
    private let searchRepository: SearchRepositoryProtocol
    
    init(
        isbn: Int,
        searchRepository: SearchRepositoryProtocol
    ) {
        self.isbn = isbn
        self.searchRepository = searchRepository
    }
    
    func process(_ action: Action) {
        
    }
}

extension SearchDetailData {
    @MainActor
    func loadBookDetail() async {
        do {
            
        } catch let error as NetworkingError {
            // TODO: error
            print("error: \(error.localizedDescription)")
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
}
