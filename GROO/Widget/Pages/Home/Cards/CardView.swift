//
//  CardView.swift
//  GROO
//
//  Created by 이예주 on 2023/05/11.
//

import SwiftUI

struct CardView: View {
    @State var readCount: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                VStack( spacing: 20) {
                    HStack(spacing: 13) {
                        PeriodPicker()
                        BooksRead(readCount: $readCount)
                    }
                    MyThought(readCount: $readCount)
                }
                ReadingBooks()
                NextReadBooks()
            }
            .padding(.horizontal, 33)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .background(Color.background)
    }
}
