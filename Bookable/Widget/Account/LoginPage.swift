//
//  LoginPage.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/02.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}

struct LoginPage: View {
    @StateObject private var viewModel = LoginViewModel()
    
    @FocusState private var focusField: AccountFocusField?
    
    var body: some View {
        VStack(spacing: 16) {
            Text("logo")
                .bold()
                .font(.system(size: 28))
                .frame(width: 240, height: 240)
                .background(Color(hex: 0xD9D9D9))
                .padding(.bottom, 24)
            
            AccountTextField(text: $viewModel.email, focusField: _focusField, field: .email)
            
            AccountTextField(text: $viewModel.password, focusField: _focusField, field: .password)
            
            loginButton
            
            passwordFindLink
            
            Text("or")
                .font(.system(size: 12))
                .frame(height: 16)
                .foregroundColor(Color(hex: 0xBBBBBB))
            
            registerLink
        }
        .fixedSize(horizontal: true, vertical: false)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.background
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    focusField = nil
                }
        )
    }
    
    private var loginButton: some View {
        Button {
            // TODO: login
        } label: {
            Text("login")
                .font(.system(size: 16, weight: .semibold))
        }
        .buttonStyle(RoundedButtonStyle())
    }
    
    private var registerLink: some View {
        NavigationLink {
            AgreementPage()
        } label: {
            Text("goToRegister")
                .font(.system(size: 16, weight: .bold))
                .frame(height: 21)
                .foregroundColor(Color.white)
        }
    }
    
    private var passwordFindLink: some View {
        NavigationLink {
            PasswordFindPage()
        } label: {
            Text("forgotPassword?")
                .font(.system(size: 14))
                .foregroundColor(Color(hex: 0x989898))
                .frame(height: 19)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
