//
//  BooksView.swift
//  GROO
//
//  Created by 이예주 on 2023/05/11.
//

import SwiftUI

struct BookshelfView: View {
    @State var isEmpty: Bool = true
    
    var body: some View {
        VStack(spacing: 0) {
            header
            
            if isEmpty {
                Spacer()
                emptyView
                Spacer()
                emptyImage
            }
        }
    }
    
    private var header: some View {
        HStack(alignment: .top, spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                Text("booksHasReadSoFar")
                    .font(.notoSansKR(.bold, size: 16))
                Text("\(0)Books")
                    .font(.notoSansKR(.bold, size: 32))
            }
            Spacer()
            Dropdown {
                HStack {
                    Text("all")
                    Image("arrow")
                        .rotationEffect(.degrees(90))
                }
            }
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 32)
    }
    
    private var emptyView: some View {
        VStack(spacing: 40) {
            Text("searchAndRecordBook")
                .font(.notoSansKR(.bold, size: 18))
                .multilineTextAlignment(.center)
            
            CustomButton(verticalPadding: 14, horizontalPadding: 36, backgroundColor: Color(hex: 0xEFEFEF), cornerRadius: 40) {
                Text("recordBook")
                    .foregroundColor(.black)
                    .font(.notoSansKR(.bold, size: 16))
            } onAction: {
                
            }
        }
    }
    
    private var emptyImage: some View {
        VStack(spacing: 0) {
            HStack(alignment: .bottom, spacing: 0) {
                ForEach(0..<maxCount, id: \.self) { _ in
                    Rectangle()
                        .frame(height: randomHeight)
                        .foregroundColor(randomColor)
                        .cornerRadius(4, corners: [.topLeft, .topRight])
                }
            }
            Rectangle()
                .foregroundColor(Color(hex: 0x272727))
                .frame(height: 12)
        }
    }
    
    /// getters
    private var maxCount: Int {
        Int(floor(round(UIApplication.shared.frameWidth / 20)))
    }
    
    private var randomHeight: CGFloat {
        let height = randomHeights.randomElement() ?? 84
        
        return height
    }
    
    private var randomColor: Color {
        let color = randomColors.randomElement() ?? Color(hex: 0x434343)
        
        return color
    }
    
    private let randomHeights: Set<CGFloat> = [84, 92, 96, 106]
    private let randomColors: Set<Color> = [Color(hex: 0x434343), Color(hex: 0x2C2C2C), Color(hex: 0x272727)]
}

struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        BookshelfView()
            .foregroundColor(.white)
            .background(Color.background)
    }
}
