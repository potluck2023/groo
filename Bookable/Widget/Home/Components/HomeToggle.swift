//
//  HomeToggle.swift
//  Bookable
//
//  Created by 이예주 on 2023/05/09.
//

import SwiftUI

struct HomeToggle: View {
    @Binding var selection: HomeType
    
    private func iconColor(_ selection: HomeType) -> Color {
        self.selection == selection ? Color(hex: 0x202020) : Color(hex: 0xEFEFEF)
    }
    
    private func backgroundColor(_ selection: HomeType) -> Color {
        self.selection == selection ? Color(hex: 0xEFEFEF) : Color.clear
    }
    
    // TODO: 전환 애니메이션 넣기
    var body: some View {
        HStack(spacing: 0) {
            Button {
                selection = .main
            } label: {
                Image("cards")
                    .foregroundColor(iconColor(.main))
                    .padding(EdgeInsets(top: 12, leading: 27, bottom: 13, trailing: 20))
                    .background(backgroundColor(.main))
                    .cornerRadius(30, corners: [.topLeft, .bottomLeft])
            }
            Button {
                selection = .list
            } label: {
                Image("books")
                    .foregroundColor(iconColor(.list))
                    .padding(EdgeInsets(top: 11, leading: 24, bottom: 11, trailing: 23.5))
                    .background(backgroundColor(.list))
                    .cornerRadius(30, corners: [.topRight, .bottomRight])
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .strokeBorder(Color(hex: 0xEFEFEF))
        )
        .background(
            LinearGradient(colors: [Color.white.opacity(0.7), Color(hex: 0x202020).opacity(0.1)], startPoint: isMain ? .leading : .trailing, endPoint: isMain ? .trailing : .leading)
                .cornerRadius(30)
        )
    }
    
    private var isMain: Bool {
        selection == .main
    }
}

struct HomeToggle_Previews: PreviewProvider {
    static var previews: some View {
        HomeToggle(selection: .constant(.main))
            .padding()
            .background(Color.background)
            .previewLayout(.sizeThatFits)
    }
}