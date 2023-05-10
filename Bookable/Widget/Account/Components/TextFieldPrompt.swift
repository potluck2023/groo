//
//  TextFieldPrompt.swift
//  Bookable
//
//  Created by 이예주 on 2023/05/10.
//

import SwiftUI

struct TextFieldPrompt: View {
    var text: String
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image("exclamation")
            Text(LocalizedStringKey(text))
                .font(.notoSansKR(.medium, size: 14))
                .foregroundColor(Color(hex: 0xD3D3D3))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct TextFieldPrompt_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldPrompt(text: "이미 사용 중인 닉네임입니다. 다른 닉네임을 입력해 주세요.")
            .frame(maxWidth: 300)
            .previewLayout(.sizeThatFits)
    }
}
