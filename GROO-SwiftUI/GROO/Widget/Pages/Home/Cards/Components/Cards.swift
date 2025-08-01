//
//  Cards.swift
//  GROO
//
//  Created by 이예주 on 2023/05/11.
//

import SwiftUI

struct PeriodPicker: View {
    
    @State private var showSheet: Bool = false
    
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
        .onTapGesture {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            VStack(spacing: 0) {
                VStack(spacing: 16) {
                    Text("원하는 기간을 선택해주세요")
                        .font(.notoSansKR(.medium, size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 24) {
                        Group {
                            Text("전체")
                            Text("1년")
                            Text("6개월")
                        }
                        .frame(width: 80, height: 30)
                        .background(Color(hex: 0xEFEFEF))
                        .clipShape(.capsule)
                    }
                    
                    HStack(spacing: 24) {
                        Group {
                            Text("3개월")
                            Text("1개월")
                        }
                        .frame(width: 80, height: 30)
                        .background(Color(hex: 0xEFEFEF))
                        .clipShape(.capsule)
                    }
                }
                .font(.notoSansKR(.medium, size: 12))
                .padding(.init(top: 20, leading: 24, bottom: 36, trailing: 24))
                
                HStack(spacing: 19) {
                    Group {
                        Text("취소")
                        Text("저장")
                    }
                    .font(.notoSansKR(.medium, size: 16))
                    .frame(width: 142, height: 50)
                    .background(Color(hex: 0xEFEFEF))
                    .clipShape(.capsule)
                }
                .padding(.vertical, 19)
                .padding(.horizontal, 36)
                
                Spacer()
            }
            .padding(.top, 35)
            .presentationDetents([.height(293)])
            .background(Color.background)
        }
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

struct MonthlyReadingTimeView: View {
    @Binding var readCount: Int
    
    var body: some View {
        if isEmpty {
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
                VStack(alignment: .leading, spacing: 21) {
                    HStack(spacing: 0) {
                        Text("이번 달 독서 시간")
                            .font(.notoSansKR(.medium, size: 14))
                        Spacer()
                        Image("arrow")
                    }
                    .foregroundStyle(Color(hex: 0xEFEFEF))
                    
                    Text("6시간 24분")
                        .font(.notoSansKR(.medium, size: 32))
                        .foregroundStyle(Color(hex: 0xEFEFEF))
                        
                    Text("지난 달보다\n32분 더 독서했어요.")
                        .font(.notoSansKR(.medium, size: 14))
                        .foregroundStyle(Color(hex: 0xD6D6D6))
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .background(Color(hex: 0x434343))
                .cornerRadius(9)
                
                FavoriteGenre(genre: .constant(.socialScience))
            }
        }
    }
    
    /// getters
    private var isEmpty: Bool {
        readCount == 0
    }
}

#Preview {
    VStack {
        HStack {
            PeriodPicker()
            BooksRead(readCount: .constant(0))
        }
        MonthlyReadingTimeView(readCount: .constant(0))
        
        MonthlyReadingTimeView(readCount: .constant(1))
            .frame(height: 180)
    }
}
