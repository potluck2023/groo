//
//  RecordPage.swift
//  GROO
//
//  Created by 이예주 on 2023/05/11.
//

import SwiftUI

struct RecordPage: View {
    @StateObject private var pathModel: PathModel
    @State private var text: String
    
    @FocusState private var focusField: Bool
    
    init(
        pathModel: PathModel = .init(),
        text: String = ""
    ) {
        _pathModel = .init(wrappedValue: pathModel)
        _text = .init(initialValue: text)
    }
    
    var body: some View {
        NavigationStack(path: $pathModel.paths) {
            VStack(spacing: 0) {
                header
                filters
                result
            }
        }
    }
    
    private var header: some View {
        HStack(alignment: .bottom) {
            Text("readingRecord")
                .font(.notoSansKR(.bold, size: 28))
            Text("thinkingNote")
                .font(.notoSansKR(.bold, size: 16))
                .foregroundColor(Color(hex: 0x626262))
            Spacer()
        }
        .padding(.vertical)
        .padding(.horizontal, 24)
    }
    
    private var filters: some View {
        HStack(spacing: 12) {
            datePicker
            dropdown
            SearchField($text, _focusField, placeholder: "") {
                
            }
        }
        .padding(.vertical)
        .padding(.horizontal, 24)
    }
    
    private var datePicker: some View {
        Button {
            
        } label: {
            ZStack {
                Circle()
                    .foregroundColor(Color(hex: 0x333333))
                    .scaledToFit()
                Image("calendar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 11.24)
                    .foregroundColor(Color(hex: 0xEFEFEF))
            }
            .frame(width: 35)
        }
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
    
    private var result: some View {
        VStack(spacing: 0) {
            Text("totalBooks \(154)")
                .font(.notoSansKR(.medium, size: 14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
                .padding(.horizontal, 24)
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(0..<5) { _ in
                        recordCard
                    }
                }
            }
        }
    }
    
    private var recordCard: some View {
        HStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 3)
                .frame(width: 62, height: 86)
                .padding(.top)
                .padding(.bottom, 17)
                .padding(.trailing)
            VStack(alignment: .leading, spacing: 0) {
                Text("literature")
                    .font(.notoSansKR(.bold, size: 12))
                    .padding(.vertical, 2)
                    .padding(.horizontal, 6)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color(hex: 0x5679F4))
                    )
                    .padding(.bottom, 7)
                Text("책먹는 여우")
                    .font(.notoSansKR(.bold, size: 20))
                    .padding(.bottom, 9.47)
                HStack(spacing: 6.25) {
                    Text("김이름")
                    Circle()
                        .scaledToFit()
                        .frame(width: 2.5)
                    Text("바다출판사")
                }
                .font(.notoSansKR(.regular, size: 14))
            }
            Spacer()
            
            Text("reading")
                .font(.notoSansKR(.bold, size: 12))
                .padding(.vertical, 5)
                .padding(.horizontal, 15)
                .modifier(ColorBorder(Color(hex: 0x696969), cornerRadius: 40))
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 18)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(hex: 0x272727))
        )
        .padding(.horizontal, 24)
        .padding(.bottom, 20)
    }
}

#Preview {
    RecordPage()
        .foregroundColor(Color(hex: 0xEFEFEF))
        .background(Color.background)
}
