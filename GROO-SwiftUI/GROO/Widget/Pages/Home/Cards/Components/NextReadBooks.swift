//
//  NextReadBooks.swift
//  GROO
//
//  Created by 이예주 on 2023/05/30.
//

import SwiftUI

struct NextReadBooks: View {
    @State var isEmpty: Bool = true
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 0) {
                Text("nextReadBook")
                    .font(.notoSansKR(.bold, size: 20))
                Spacer()
                if !isEmpty {
                    Text("viewAll")
                        .font(.notoSansKR(.medium, size: 16))
                }
            }
            
            if isEmpty {
                emptyView
            }
        }
    }
    
    private var addButton: some View {
        Button {
            // TODO: add next read book
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 9)
                    .foregroundColor(Color(hex: 0x3E3E3E))
                    .frame(height: 120)
                Circle()
                    .scaledToFit()
                    .frame(width: 37)
                    .foregroundColor(Color(hex: 0x202020).opacity(0.56))
                    .modifier(ColorBorder(Color(hex: 0x787878), cornerRadius: 50))
                PlusIcon(color: Color(hex: 0xEFEFEF), lineWidth: 2, size: 14)
            }
        }
    }
    
    private var emptyView: some View {
        HStack(spacing: 16) {
            addButton
            ForEach(0..<2) { _ in
                RoundedRectangle(cornerRadius: 9)
                    .foregroundColor(Color(hex: 0x282828))
                    .frame(height: 120)
            }
        }
    }
}

struct PlusIcon: View {
    var color: Color = .black
    var lineWidth: CGFloat = 1
    var size: CGFloat
    var cornerRadius: CGFloat = 10
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(color)
                .frame(height: lineWidth)
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(color)
                .frame(width: lineWidth)
        }
        .scaledToFit()
        .frame(width: size)
    }
}

struct NextReadBooks_Previews: PreviewProvider {
    static var previews: some View {
        NextReadBooks()
            .previewLayout(.sizeThatFits)
    }
}
