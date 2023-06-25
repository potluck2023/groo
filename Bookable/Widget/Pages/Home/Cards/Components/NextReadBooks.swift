//
//  NextReadBooks.swift
//  Bookable
//
//  Created by 이예주 on 2023/05/30.
//

import SwiftUI

struct NextReadBooks: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 0) {
                Text("nextReadBook")
                    .font(.notoSansKR(.bold, size: 20))
                Spacer()
                Text("viewAll")
                    .font(.notoSansKR(.medium, size: 16))
            }
            
            HStack(spacing: 16) {
                ForEach(0..<3) { _ in
                    RoundedRectangle(cornerRadius: 9)
                        .frame(height: 120)
                }
            }
        }
    }
}

struct NextReadBooks_Previews: PreviewProvider {
    static var previews: some View {
        NextReadBooks()
    }
}
