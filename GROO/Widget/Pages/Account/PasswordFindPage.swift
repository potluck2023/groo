//
//  PasswordFindPage.swift
//  GROO
//
//  Created by 이예주 on 2023/04/02.
//

import SwiftUI

class PasswordFindViewModel: ObservableObject {
    @Published var email: String = ""
}

struct PasswordFindPage: View {
    @StateObject private var viewModel = PasswordFindViewModel()
    
    @FocusState private var focusField: AccountFocusField?
    
    var body: some View {
        VStack(spacing: 0) {
            Text("passwordReset")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 8)
                .padding(.top, 49)
            Text("Lorem ipsum dolor sit amet\nconsectetur. Enim neque leo\nconsequat sit eget.")
                .foregroundColor(Color(hex: 0xB8B8B8))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 55)
            VStack(spacing: 16) {
                AccountTextField(text: $viewModel.email, focusField: _focusField, field: .email)
                TextFieldPrompt(text: "emailNotRegisteredError")
                Button {
                    // TODO: send email
                } label: {
                    Text("sendEmail")
                        .fontWeight(.semibold)
                }
                .padding(.top)
                .buttonStyle(RoundedButtonStyle())
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

struct PasswordFindPage_Previews: PreviewProvider {
    static var previews: some View {
        PasswordFindPage()
    }
}
