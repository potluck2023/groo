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
                    .font(.notoSansKR(.medium, size: 14))
                    .focused($focusField)
                    .onSubmit {
                        focusField = false
                        onSubmit()
                    }
            }
            
            searchButton
        }
        .padding(.horizontal, 16)
        .frame(height: 35)
        .colorBorder(Color(hex: 0x696969), cornerRadius: 40)
    }
    
    // MARK: - buttons
    private var searchButton: some View {
        Image(.search)
            .frame(width: 16, height: 16)
            .contentShape(.rect)
            .onTapGesture {
                focusField = false
                onSubmit()
            }
    }
}

#Preview {
    SearchField(.constant(""), .init(), placeholder: "", onSubmit: { })
}
