//
//  SearchPage.swift
//  GROO
//
//  Created by 이예주 on 2023/05/11.
//

import SwiftUI

struct SearchPage: View {
    @StateObject private var pathModel: PathModel
    @StateObject private var searchData: SearchData
    @State private var text: String
    
    @FocusState private var focusField: Bool
    
    @State private var moveToTop: Bool = false
    
    init(
        pathModel: PathModel = .init(),
        text: String = "",
        searchData: SearchData = .init()
    ) {
        _pathModel = .init(wrappedValue: pathModel)
        _text = .init(initialValue: text)
        _searchData = .init(wrappedValue: searchData)
    }
    
    var body: some View {
        NavigationStack(path: $pathModel.paths) {
            VStack(spacing: 0) {
                header
                    .zIndex(1)
                
                if searchData.books.isEmpty {
                    if searchData.totalBookCount == 0 {
                        Text("emptySearchResult")
                            .font(.notoSansKR(.semibold, size: 18))
                            .foregroundStyle(Color(hex: 0xEFEFEF))
                            .frame(maxHeight: .infinity)
                    } else {
                        emptyView
                            .frame(maxHeight: .infinity)
                    }
                } else {
                    
                    bookList
                }
            }
            .foregroundStyle(Color(hex: 0xEFEFEF))
            .background(Color.background)
        }
    }
    
    private var header: some View {
        HStack(spacing: 10) {
            DropdownView(selection: $searchData.searchType, options: BookSearchType.allCases, maxWidth: 86)
            
            SearchField($text, _focusField, placeholder: "searchBook") {
                moveToTop.toggle()
                search()
            }
        }
        .padding(.vertical, 32)
        .padding(.horizontal, 24)
    }
    
    private var emptyView: some View {
        VStack(spacing: 87) {
            Text("searchBooksDescription")
                .font(.notoSansKR(.bold, size: 18))
                .multilineTextAlignment(.center)
            Image("search_main")
                .resizable()
                .scaledToFit()
                .frame(width: 258)
        }
    }
    
    private var bookList: some View {
        VStack(spacing: 0) {
            Text("resultBooks \(searchData.totalBookCount)")
                .font(.notoSansKR(.medium, size: 14))
                .frame(maxWidth: .infinity, minHeight: 43, alignment: .leading)
                .padding(.horizontal, 24)
            
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 0) {
                        PullToRefreshView("bookList") {
                            search()
                        }
                        .id("TOP")
                        
                        LazyVStack(spacing: 20) {
                            ForEach(searchData.books, id: \.id) { book in
                                SearchBookCard(book)
                            }
                            
                            CustomProgressView {
                                if !searchData.isLastBook {
                                    search(page: searchData.pageIndex)
                                }
                            }
                        }
                        .padding(.init(top: 12, leading: 24, bottom: 12, trailing: 24))
                    }
                }
                .coordinateSpace(name: "bookList")
                .onChange(of: moveToTop) { _ in
                    proxy.scrollTo("TOP")
                }
            }
        }
    }
    
    // MARK: - functions
    private func search(page: Int = 1) {
        guard !text.isEmpty else {
            // TODO: error
            return
        }
        switch searchData.searchType {
        case .title:
            searchData.process(.searchWithTitle(text, page: page))
        case .author:
            searchData.process(.searchWithAuthor(text, page: page))
        case .isbn:
            searchData.process(.searchWithISBN(text, page: page))
        }
    }
}

#if DEBUG
#Preview {
    VStack {
        let searchData: SearchData = .init(searchRepository: StubSearchRepository())
        
        SearchPage(searchData: searchData)
            .task {
                searchData.process(.searchWithTitle(""))
            }
    }
}
#endif
