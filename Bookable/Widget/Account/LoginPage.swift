//
//  LoginPage.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/02.
//

import SwiftUI

struct LoginPage: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    @FocusState private var focusField: AccountFocusField?
    
    var body: some View {
        VStack(spacing: 16) {
            Text("logo")
                .bold()
                .font(.system(size: 28))
                .frame(width: 240, height: 240)
                .background(Color(hex: 0xD9D9D9))
                .padding(.bottom, 24)
            
            AccountTextField(text: $email, focusField: _focusField, field: .email)
            
            AccountTextField(text: $password, focusField: _focusField, field: .password)
            
            Button {
                // TODO: find password
            } label: {
                Text("비밀번호를 잊으셨나요?")
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: 0x989898))
                    .frame(height: 19)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Button {
                // TODO: login
            } label: {
                Text("로그인")
                    .font(.system(size: 16, weight: .semibold))
                    .frame(height: 21)
                    .foregroundColor(Color(hex: 0x202020))
                    .frame(height: 46)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 49)
                            .fill(Color.white)
                    )
            }
            
            Text("또는")
                .font(.system(size: 12))
                .frame(height: 16)
                .foregroundColor(Color(hex: 0xBBBBBB))
            
            Button {
                // TODO: register
            } label: {
                Text("회원 가입하기")
                    .font(.system(size: 16, weight: .bold))
                    .frame(height: 21)
                    .foregroundColor(Color.white)
            }
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
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
