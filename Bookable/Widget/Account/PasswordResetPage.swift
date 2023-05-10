//
//  PasswordResetPage.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/02.
//

import SwiftUI

class PasswordResetViewModel: ObservableObject {
    @Published var password: String = ""
    @Published var passwordConfirm: String = ""
}

struct PasswordResetPage: View {
    @StateObject private var viewModel = PasswordResetViewModel()
    
    @FocusState private var focusField: AccountFocusField?
    
    var body: some View {
        VStack(spacing: 0) {
            Text("newPassword")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 8)
                .padding(.top, 49)
            Text("Lorem ipsum dolor sit amet\nconsectetur. Enim neque leo\nconsequat sit eget.")
                .foregroundColor(Color(hex: 0xB8B8B8))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 55)
            VStack(spacing: 19) {
                VStack(spacing: 12) {
                    AccountTextField(text: $viewModel.password, focusField: _focusField, field: .password)
                    TextFieldPrompt(text: "passwordRegexError")
                }
                
                VStack(spacing: 12) {
                    AccountTextField(text: $viewModel.passwordConfirm, focusField: _focusField, field: .passwordConfirm)
                    TextFieldPrompt(text: "passwordRegexError")
                }
                
                Button {
                    // TODO: save
                } label: {
                    Text("save")
                        .fontWeight(.semibold)
                }
                .buttonStyle(RoundedButtonStyle())
                .padding(.top)
            }
            .padding(.horizontal, 6)
            Spacer()
        }
        .padding(.horizontal, 49)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.background
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    focusField = nil
                }
        )
    }
}

struct PasswordResetPage_Previews: PreviewProvider {
    static var previews: some View {
        PasswordResetPage()
    }
}
