//
//  SearchField.swift
//  GROO
//
//  Created by 이예주 on 2023/07/17.
//

import SwiftUI

struct SearchField: View {
    @Binding private var text: String
    @FocusState private var focusField: Bool
    private let placeholder: String
    private let onSubmit: () -> Void
    
    init(
        _ text: Binding<String>,
        _ focusField: FocusState<Bool>,
        placeholder: String,
        onSubmit: @escaping () -> Void
    ) {
        _text = text
        _focusField = focusField
        self.placeholder = placeholder
        self.onSubmit = onSubmit
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack(alignment: .leading) {
                Text(LocalizedStringKey(placeholder))
                    .font(.notoSansKR(.medium, size: 14))
                    .foregroundStyle(text.isEmpty ? Color(hex: 0x696969) : .clear)
                
                TextField("", text: $text)
                    .focused($focusField)
                    .onSubmit {
                        onSubmit()
                    }
            }
            .padding(.vertical, 8)
            .padding(.leading)
            Image("search")
                .padding(9.5)
                .foregroundColor(Color(hex: 0xEFEFEF))
        }
        .modifier(ColorBorder(Color(hex: 0x696969), cornerRadius: 40))
    }
}
