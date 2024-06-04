//
//  SearchBookCard.swift
//  GROO
//
//  Created by isabella joo on 6/4/24.
//

import SwiftUI

struct SearchBookCard: View {
    private let book: Book
    
    init(_ book: Book) {
        self.book = book
    }
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            ImageView(for: book.imageURL)
                .frame(width: 58, height: 80)
                .cornerRadius(3)
            
            info
            menu
        }
        .padding(16)
        .background(Color(hex: 0x272727))
        .cornerRadius(10)
    }
    
    private var info: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(book.title)
                .font(.notoSansKR(.semibold, size: 20))
                .lineLimit(1)
                .frame(minHeight: 30, alignment: .top)
            
            Text("\(book.authors) • \(book.publisher)")
                .font(.notoSansKR(.regular, size: 14))
                .lineLimit(2)
                .frame(minHeight: 21, alignment: .top)
                .padding(.bottom, 8)
            
            HStack(spacing: 0) {
                Text("ISBN ")
                    .font(.notoSansKR(.medium, size: 14))
                Text("\(book.isbn)")
                    .font(.notoSansKR(.regular, size: 14))
            }
            .lineLimit(1)
            .frame(minHeight: 21, alignment: .top)
        }
        .foregroundStyle(Color(hex: 0xEFEFEF))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var menu: some View {
        VStack(spacing: 16) {
            startButton
            newThoughtButton
        }
        .frame(maxHeight: .infinity)
    }
    
    // MARK: - buttons
    private var startButton: some View {
        Button {
            // TODO: start
        } label: {
            Image(.start)
        }
        .buttonStyle(.plain)
    }
    
    private var newThoughtButton: some View {
        Button {
            // TODO: new Thought
        } label: {
            Image(.newThought)
        }
        .buttonStyle(.plain)
    }
}

#if DEBUG
#Preview {
    ScrollView {
        let books = BookListObject.stub1.docs.map { $0.toModel() }
        
        ForEach(books, id: \.self) { book in
            SearchBookCard(book)
        }
    }
}
#endif
