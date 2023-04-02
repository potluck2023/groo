//
//  PasswordFindPage.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/02.
//

import SwiftUI

struct PasswordFindPage: View {
    @State private var email: String = ""
    
    @FocusState private var focusField: AccountFocusField?
    
    var body: some View {
        VStack(spacing: 0) {
            Text("비밀번호 초기화")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 8)
                .padding(.top, 49)
            Text("Lorem ipsum dolor sit amet\nconsectetur. Enim neque leo\nconsequat sit eget.")
                .foregroundColor(Color(hex: 0xB8B8B8))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 55)
            VStack(spacing: 0) {
                AccountTextField(text: $email, focusField: _focusField, field: .email)
                    .padding(.bottom)
                Text("가입된 적 없는 이메일 주소입니다. 이메일 주소를 다시 한번 확인해주세요")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: 0xD3D3D3))
                    .padding(.bottom)
                Button {
                    // TODO: send email
                } label: {
                    Text("인증메일 보내기")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hex: 0x202020))
                        .frame(height: 46)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 40).fill(.white))
                }
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

struct PasswordFindPage_Previews: PreviewProvider {
    static var previews: some View {
        PasswordFindPage()
    }
}
