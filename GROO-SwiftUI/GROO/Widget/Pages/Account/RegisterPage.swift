//
//  RegisterPage.swift
//  GROO
//
//  Created by 이예주 on 2023/04/02.
//

import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordConfirm: String = ""
    
    private let accountRepository: AccountRepositoryProtocol
    
    init(accountRepository: AccountRepositoryProtocol = AccountRepository()) {
        self.accountRepository = accountRepository
    }
    
    func sendVerificationEmail() async {
        do {
            try await accountRepository.postMailCheck(email: email)
        } catch {
            Log(error)
        }
    }
}

struct RegisterPage: View {
    @StateObject private var viewModel = RegisterViewModel()
    
    @FocusState private var focusField: AccountFocusField?
    
    var body: some View {
        VStack(spacing: 0) {
            Text("register")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 49)
                .padding(.bottom, 8)
            Text("Lorem ipsum dolor sit amet\nconsectetur. Enim neque leo\nconsequat sit eget.")
                .foregroundColor(Color(hex: 0xB8B8B8))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 55)
            
            VStack(spacing: 19) {
                AccountTextField(text: $viewModel.name, focusField: _focusField, field: .name)
                VStack(spacing: 12) {
                    AccountTextField(text: $viewModel.email, focusField: _focusField, field: .email)
                    TextFieldPrompt(text: "emailDuplicatedError")
                }
                
                VStack(spacing: 12) {
                    AccountTextField(text: $viewModel.password, focusField: _focusField, field: .password)
                    TextFieldPrompt(text: "passwordRegexError")
                }
                
                VStack(spacing: 12) {
                    AccountTextField(text: $viewModel.passwordConfirm, focusField: _focusField, field: .passwordConfirm)
                    TextFieldPrompt(text: "passwordRegexError")
                }
                
                Button {
                    // TODO: validation check
                    Task {
                        await viewModel.sendVerificationEmail()
                    }
                } label: {
                    Text("next")
                        .fontWeight(.semibold)
                }
                .buttonStyle(RoundedButtonStyle())
                .padding(.top)
            }
            .padding(.horizontal, 6)
            Spacer()
        }
        .padding(.horizontal, 49)
        .background(
            Color.background
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    focusField = nil
                }
        )
    }
}

struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPage()
    }
}
