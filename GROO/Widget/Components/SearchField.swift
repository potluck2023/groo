//
//  SearchField.swift
//  GROO
//
//  Created by 이예주 on 2023/07/17.
//

import SwiftUI

struct SearchField: View {
    @Binding var text: String
    @FocusState var focusField: Bool
    var placeholder: String
    let onAction: () -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack(alignment: .leading) {
                Text(LocalizedStringKey(placeholder))
                    .font(.notoSansKR(.medium, size: 14))
                    .foregroundColor(Color(hex: 0x696969))
                TextField("", text: $text)
                    .focused($focusField)
            }
            .padding(.vertical, 8)
            .padding(.leading)
            
            Button {
                onAction()
            } label: {
                Image("search")
                    .padding(9.5)
                    .foregroundColor(Color(hex: 0xEFEFEF))
            }
        }
        .modifier(ColorBorder(Color(hex: 0x696969), cornerRadius: 40))
    }
}
