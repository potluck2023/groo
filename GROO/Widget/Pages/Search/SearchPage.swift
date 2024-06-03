//
//  SearchPage.swift
//  GROO
//
//  Created by 이예주 on 2023/05/11.
//

import SwiftUI

struct SearchPage: View {
    @StateObject private var pathModel: PathModel
    @StateObject private var searchData = SearchData()
    @State private var text: String
    @State private var isEmpty: Bool
    
    @FocusState private var focusField: Bool
    
    init(
        pathModel: PathModel = .init(),
        text: String = "",
        isEmpty: Bool = true
    ) {
        _pathModel = .init(wrappedValue: pathModel)
        _text = .init(initialValue: text)
        _isEmpty = .init(initialValue: isEmpty)
    }
    
    var body: some View {
        NavigationStack(path: $pathModel.paths) {
            VStack(spacing: 0) {
                header
                
                if isEmpty {
                    Spacer()
                    emptyView
                    Spacer()
                }
            }
            .foregroundStyle(Color(hex: 0xEFEFEF))
            .background(Color.background)
        }
    }
    
    private var header: some View {
        HStack(spacing: 10) {
            dropdown
            SearchField($text, _focusField, placeholder: "searchBook") {
                searchData.process(.search(text: text))
            }
        }
        .padding(.vertical, 32)
        .padding(.horizontal, 24)
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
}

#Preview {
    Main(selection: .search)
}
