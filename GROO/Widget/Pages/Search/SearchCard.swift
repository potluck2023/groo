//
//  SearchCard.swift
//  GROO
//
//  Created by 이예주 on 2023/08/14.
//

import SwiftUI

struct SearchCard: View {
    var book: Book
    
    var body: some View {
        HStack(spacing: 0) {
            ImageView(imageUrl: book.image)
                .frame(width: 58, height: 80)
                .cornerRadius(3)
                .padding(.trailing)
            VStack(alignment: .leading, spacing: 0) {
                Text(book.title)
                    .font(.notoSansKR(.bold, size: 20))
                HStack(spacing: 0) {
                    Text(book.authors)
                        .padding(.trailing, 4)
                    Circle()
                        .frame(width: 2.5, height: 2.5)
                        .padding(.trailing, 6)
                    Text(book.publisher)
                }
                Spacer()
                Text("ISBN \(book.isbn)")
            }
            .foregroundColor(Color(hex: 0xEFEFEF))
            .padding(.trailing, 10)
            Spacer()
            VStack(spacing: 0) {
                Button {
                    print("Play")
                } label: {
                    Circle()
                        .strokeBorder(Color(hex: 0x717171))
                        .frame(width: 28, height: 28)
                        .overlay(
                            Image("play")
                                .foregroundColor(Color(hex: 0xD2D2D2))
                        )
                }

                Spacer()
                Button {
                    print("newThought")
                } label: {
                    Circle()
                        .strokeBorder(Color(hex: 0x717171))
                        .frame(width: 28, height: 28)
                        .overlay(
                            Image("newThought")
                                .resizable()
                                .foregroundColor(Color(hex: 0xD2D2D2))
                                .scaledToFit()
                                .frame(width: 12)
                        )
                }

            }
            .padding(.vertical, 4)
        }
        .font(.notoSansKR(.medium, size: 14))
        .padding()
        .background(Color(hex: 0x272727))
        .cornerRadius(10)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct SearchCard_Previews: PreviewProvider {
    static var previews: some View {
        SearchCard(book: Book(title: "책먹는 여우", image: "http://image.aladin.co.kr/product/15652/86/cover/k232533034_1.jpg", authors: "김이름", publisher: "바다출판사", publicationYear: "0", isbn: "1234567891011"))
            .previewLayout(.sizeThatFits)
    }
}
