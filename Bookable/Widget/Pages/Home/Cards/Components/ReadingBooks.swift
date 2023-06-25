//
//  ReadingBooks.swift
//  Bookable
//
//  Created by 이예주 on 2023/05/30.
//

import SwiftUI

struct ReadingBooks: View {
    var body: some View {
        VStack(spacing: 24) {
            header
            emptyView
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("readingBook")
                .font(.notoSansKR(.bold, size: 20))
            Spacer()
            Text("viewAll")
                .font(.notoSansKR(.medium, size: 16))
        }
    }
    
    private var emptyView: some View {
        ZStack(alignment: .bottom) {
            rectangle(Color(hex: 0x323232), topPadding: 56, horizontalPadding: 10)
            rectangle(Color(hex: 0x3E3E3E), topPadding: 40, horizontalPadding: 27.5)
            rectangle(Color(hex: 0x2E2E2E), topPadding: 17, horizontalPadding: 47)
            rectangle(Color(hex: 0x3E3E3E), topPadding: 0, horizontalPadding: 69.5)
            VStack(spacing: 16) {
                Text("recordReadingBooks")
                    .foregroundColor(Color(hex: 0xEFEFEF))
                    .font(.notoSansKR(.bold, size: 14))
                CustomButton {
                    Text("recordBook")
                } onAction: {
                    
                }
            }
            .padding(.vertical, 26.5)
            .frame(maxWidth: .infinity)
            .background(Color(hex: 0x272727))
            .cornerRadius(16)
        }
        .frame(height: 254)
    }
    
    private func rectangle(_ color: Color, topPadding: CGFloat, horizontalPadding: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundColor(color)
            .padding(.top, topPadding)
            .padding(.horizontal, horizontalPadding)
    }
}

struct ReadingBooks_Previews: PreviewProvider {
    static var previews: some View {
        ReadingBooks()
    }
}
