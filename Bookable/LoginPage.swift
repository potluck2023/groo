//
//  LoginPage.swift
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
}

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
            
            HStack(spacing: 12) {
                // TODO: icon
                Circle()
                    .fill(Color(hex: 0xD7D7D7))
                    .frame(width: 16, height: 16)
                
                TextField("", text: $email)
                    .placeholder(when: email.isEmpty, placeholder: {
                        Text("이메일")
                            .foregroundColor(Color(hex: 0x808080))
                    })
                    .focused($focusField, equals: .email)
            }
            .foregroundColor(Color(hex: 0x808080))
            .frame(height: 46)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 49)
                    .foregroundStyle(LinearGradient(colors: [Color(hex: 0x272727), Color(hex: 0x3E3E3E)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .onTapGesture {
                        focusField = .email
                    }
            )
            
            HStack(spacing: 12) {
                // TODO: icon
                Circle()
                    .fill(Color(hex: 0xD7D7D7))
                    .frame(width: 16, height: 16)
                
                TextField("", text: $password)
                    .placeholder(when: password.isEmpty, placeholder: {
                        Text("비밀번호")
                            .foregroundColor(Color(hex: 0x808080))
                    })
                    .focused($focusField, equals: .password)
            }
            .foregroundColor(Color(hex: 0x808080))
            .frame(height: 46)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 49)
                    .foregroundStyle(LinearGradient(colors: [Color(hex: 0x272727), Color(hex: 0x3E3E3E)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .onTapGesture {
                        focusField = .password
                    }
            )
            
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
                    .font(.system(size: 16, weight: .bold))
                    .frame(height: 21)
                    .foregroundColor(Color(hex: 0x202020))
            }
            .frame(height: 46)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 49)
                    .fill(Color.white)
            )
            
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
        )
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
