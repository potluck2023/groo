//
//  AccountTextField.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/02.
//

import SwiftUI

enum AccountFocusField {
    case name
    case email
    case password
    case passwordConfirm
    
    var placeholder: String {
        switch self {
        case .name:
            return "닉네임"
        case .email:
            return "이메일"
        case .password:
            return "비밀번호"
        case .passwordConfirm:
            return "비밀번호 확인"
        }
    }
    
    // TODO: icon name
    var icon: String {
        switch self {
        case .name:
            return ""
        case .email:
            return ""
        case .password:
            return ""
        case .passwordConfirm:
            return ""
        }
    }
}

struct AccountTextField: View {
    @Binding private var text: String
    @FocusState private var focusField: AccountFocusField?
    private let field: AccountFocusField
    
    init(text: Binding<String>, focusField: FocusState<AccountFocusField?>, field: AccountFocusField) {
        self._text = text
        self._focusField = focusField
        self.field = field
    }
    
    var body: some View {
        HStack(spacing: 12) {
            // TODO: icon
            Circle()
                .fill(Color(hex: 0xD7D7D7))
                .frame(width: 16, height: 16)
            
            TextField("", text: $text)
                .placeholder(when: text.isEmpty) {
                    Text(field.placeholder)
                        .foregroundColor(Color(hex: 0x808080))
                }
                .focused($focusField, equals: field)
        }
        .foregroundColor(Color(hex: 0x808080))
        .frame(height: 46)
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 49)
                .foregroundStyle(LinearGradient(colors: [Color(hex: 0x272727), Color(hex: 0x3E3E3E)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .onTapGesture {
                    focusField = field
                }
        )
    }
}

struct AccountTextField_Previews: PreviewProvider {
    static var previews: some View {
        AccountTextField(text: .constant(""), focusField: FocusState(), field: .email)
    }
}
