//
//  RegisterPage.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/02.
//

import SwiftUI

struct RegisterPage: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordConfirm: String = ""
    
    @FocusState private var focusField: AccountFocusField?
    
    var body: some View {
        VStack(spacing: 55) {
            Text("회원 가입")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 8)
            Text("Lorem ipsum dolor sit amet\nconsectetur. Enim neque leo\nconsequat sit eget.")
                .foregroundColor(Color(hex: 0xB8B8B8))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 0) {
                AccountTextField(text: $name, focusField: _focusField, field: .name)
                    .padding(.bottom)
                Text("이미 사용 중인 닉네임입니다. 다른 닉네임을 입력해 주세요.")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: 0xD3D3D3))
                AccountTextField(text: $email, focusField: _focusField, field: .email)
                    .padding(.vertical)
                Text("이미 사용 중인 이메일 주소입니다. 다른 이메일 주소를 입력해 주세요.")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: 0xD3D3D3))
                AccountTextField(text: $password, focusField: _focusField, field: .password)
                    .padding(.vertical)
                AccountTextField(text: $passwordConfirm, focusField: _focusField, field: .passwordConfirm)
                    .padding(.vertical)
                Button {
                    // TODO: send email
                } label: {
                    Text("인증메일 보내기")
                        .foregroundColor(Color(hex: 0x202020))
                        .frame(height: 46)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 40).fill(.white))
                }
                .padding(.top)
            }
            .padding(.horizontal, 6)
        }
        .padding(.horizontal, 49)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}

struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPage()
    }
}
