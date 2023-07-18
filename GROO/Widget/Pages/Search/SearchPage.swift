//
//  SearchPage.swift
//  GROO
//
//  Created by 이예주 on 2023/05/11.
//

import SwiftUI

struct SearchPage: View {
    @State var text: String = ""
    @State var isEmpty: Bool = true
    
    @FocusState private var focusField: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            header
            
            if isEmpty {
                Spacer()
                emptyView
                Spacer()
            }
        }
    }
    
    private var header: some View {
        HStack(spacing: 10) {
            dropdown
            SearchField(text: $text, focusField: _focusField, placeholder: "searchBook")
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

struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
        SearchPage()
            .background(Color.background)
    }
}
