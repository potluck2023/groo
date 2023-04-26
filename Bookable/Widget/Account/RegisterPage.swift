//
//  RegisterPage.swift
//  Bookable
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
            
            VStack(spacing: 0) {
                AccountTextField(text: $viewModel.name, focusField: _focusField, field: .name)
                    .padding(.bottom)
                Text("nameDuplicatedError")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: 0xD3D3D3))
                AccountTextField(text: $viewModel.email, focusField: _focusField, field: .email)
                    .padding(.vertical)
                Text("emailDuplicatedError")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: 0xD3D3D3))
                AccountTextField(text: $viewModel.password, focusField: _focusField, field: .password)
                    .padding(.vertical)
                AccountTextField(text: $viewModel.passwordConfirm, focusField: _focusField, field: .passwordConfirm)
                    .padding(.vertical)
                Button {
                    Task {
                        await viewModel.sendVerificationEmail()
                    }
                } label: {
                    Text("sendEmail")
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
