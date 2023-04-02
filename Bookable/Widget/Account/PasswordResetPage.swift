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
            Text("새 비밀번호")
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
                AccountTextField(text: $viewModel.password, focusField: _focusField, field: .password)
                    .padding(.bottom)
                AccountTextField(text: $viewModel.passwordConfirm, focusField: _focusField, field: .passwordConfirm)
                    .padding(.bottom)
                Button {
                    // TODO: save
                } label: {
                    Text("저장")
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

struct PasswordResetPage_Previews: PreviewProvider {
    static var previews: some View {
        PasswordResetPage()
    }
}
