//
//  SearchPage.swift
//  GROO
//
//  Created by 이예주 on 2023/05/11.
//

import SwiftUI

struct SearchPage: View {
    @StateObject private var searchData = SearchData()
    @State var text: String = ""
    
    @FocusState private var focusField: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                header
                
                if searchData.isEmptyData {
                    totalBooks
                    Spacer()
                    emptyData
                    Spacer()
                } else {
                    if searchData.books.isEmpty {
                        Spacer()
                        emptyView
                        Spacer()
                    } else {
                        totalBooks
                        searchList
                    }
                }
            }
            .background(Color.background)
        }
    }
    
    private var header: some View {
        HStack(spacing: 10) {
            dropdown
            SearchField(text: $text, focusField: _focusField, placeholder: "searchBook") {
                Task {
                    await searchData.search(title: text)
                }
            }
        }
        .padding(.vertical, 32)
        .padding(.horizontal, 24)
        .environmentObject(searchData)
    }
    
    private var dropdown: some View {
        Dropdown(borderColor: .clear, backgroundColor: Color(hex: 0x333333)) {
            HStack {
                Text("title")
                    .font(.notoSansKR(.medium, size: 14))
                Image("arrow")
                    .rotationEffect(.degrees(90))
            }
        }
    }
    
    private var totalBooks: some View {
        Text("resultBooks \(searchData.total)")
            .font(.notoSansKR(.medium, size: 14))
            .frame(height: 43)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 24)
    }
    
    private var searchList: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(searchData.books, id: \.self) { book in
                    NavigationLink(destination: Text(book.title)) {
                        SearchCard(book: book)
                    }
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            
            VStack(spacing: 16) {
                Text("cannotFindBook")
            }
        }
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
    
    private var emptyData: some View {
        VStack(spacing: 16) {
            Text("emptySearchResult")
                .font(.notoSansKR(.bold, size: 18))
            Text("requestBookRegistration")
                .foregroundColor(Color(hex: 0xEBEBEB))
                .font(.notoSansKR(.regular, size: 14))
                .underline()
        }
    }
}

struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
        SearchPage()
            .background(Color.background)
            .foregroundColor(Color(hex: 0xEFEFEF))
    }
}
