//
//  SearchData.swift
//  GROO
//
//  Created by 이예주 on 2023/07/18.
//

import SwiftUI

class SearchData: ObservableObject {
    @Published private(set) var books: [Book] = []
    @Published private(set) var total: Int = 0
    @Published private(set) var isEmptyData: Bool = false
    
    private let searchRepository: SearchRepositoryProtocol
    
    init(searchRepository: SearchRepositoryProtocol = SearchRepository()) {
        self.searchRepository = searchRepository
    }
    
    func search(title: String) async {
        do {
            let response = try await searchRepository.getSearch(title: title)
            
            await MainActor.run {
                books = response.contents
                total = response.totalCount
                
                isEmptyData = books.isEmpty && response.contents.isEmpty
            }
        } catch let error as AuthenticationError {
            switch error {
            case .invalidCredentials:
                Log(error.localizedDescription)
            case .custom(let error):
                await MainActor.run {
//                    NotificationCenter.default.post(name: .showToast, object: error.message)
                    Log(error)
                }
            }
        } catch {
            Log(error.localizedDescription)
        }
    }
}
