//
//  Cards.swift
//  Bookable
//
//  Created by 이예주 on 2023/05/11.
//

import SwiftUI

struct PeriodPicker: View {
    var body: some View {
        VStack(spacing: 8) {
            Image("calendar")
            HStack(spacing: 4) {
                Text("\(1)Month")
                    .font(.notoSansKR(.bold, size: 14))
                Image("arrow")
            }
        }
        .foregroundColor(.black)
        .frame(width: 72, height: 72)
        .background(Color(hex: 0xEFEFEF))
        .cornerRadius(9)
    }
}

struct BooksRead: View {
    @Binding var readCount: Int
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            Text("booksRead")
            Spacer()
            Text("\(readCount)")
                .font(.notoSansKR(.bold, size: 28))
                .frame(maxHeight: 28)
            Text("books")
        }
        .padding(.vertical, 10)
        .padding(.trailing, 12)
        .padding(.leading, 30)
        .background(Color(hex: 0x434343))
        .cornerRadius(4, corners: [.topLeft, .bottomLeft])
        .padding(.vertical, 12)
        .padding(.leading, 13)
        .background(Color(hex: 0x272727))
        .cornerRadius(9)
        .overlay(
            Image("bookmark")
                .padding(.top, 12)
                .padding(.leading, 20),
            alignment: .topLeading
        )
    }
}

struct MyThought: View {
    @Binding var readCount: Int
    
    var body: some View {
        if readCount == 0 {
            VStack(spacing: 20) {
                Text("organizeYourThoughts")
                    .font(.notoSansKR(.bold, size: 14))
                    .foregroundColor(.white)
                CustomButton {
                    Text("recordThought")
                } onAction: {
                    
                }
            }
            .padding(.vertical, 48)
            .frame(maxWidth: .infinity)
            .background(Color(hex: 0x434343))
            .cornerRadius(9)
        } else {
            HStack(spacing: 14) {
                VStack(spacing: 12) {
                    HStack(spacing: 0) {
                        Text("myThought")
                        Spacer()
                        Image("arrow")
                    }
                    Text("개인적으로 이 만화를 보면서 책을 사랑하는 마음이 커졌다. 여우와 인간의 이야기를 통해 책이 가지는 매력과 그 중요성을 깨")
                        .font(.notoSansKR(.medium, size: 14))
                        .lineLimit(4)
                        .multilineTextAlignment(.leading)
                    HStack(spacing: 0) {
                        Text("책먹는 여우")
                        Spacer()
                        Text("23/10/21")
                    }
                    .font(.notoSansKR(.medium, size: 14))
                }
                .padding(.horizontal)
                .padding(.vertical, 14)
                .background(Color(hex: 0x434343))
                .cornerRadius(9)
                
                FavoriteGenre(genre: .constant(.socialScience))
            }
        }
    }
}



struct Cards_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PeriodPicker()
            BooksRead(readCount: .constant(0))
            MyThought(readCount: .constant(0))
        }
    }
}
