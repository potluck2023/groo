//
//  EmailVerificationPage.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/16.
//

import SwiftUI

struct EmailVerificationPage: View {
    @FocusState private var focusField: Bool?
    
    var body: some View {
        VStack(spacing: 0) {
            Text("emailVerification")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 8)
                .padding(.top, 49)
            Text("Lorem ipsum dolor sit amet\nconsectetur. Enim neque leo\nconsequat sit eget.")
                .foregroundColor(Color(hex: 0xB8B8B8))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 55)
            
            codeField
                .padding(.bottom, 22)
            resendEmailButton
            Spacer()
            Button {
                // TODO: save
            } label: {
                Text("ok")
                    .fontWeight(.semibold)
            }
            .buttonStyle(RoundedButtonStyle())
            .padding(.top)
            .padding(.horizontal, 6)
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
    
    private var codeField: some View {
        HStack(spacing: 8) {
            ForEach(0..<6) { index in
                codeSection(String(index))
            }
        }
    }
    
    private func codeSection(_ number: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4.36)
                .scaledToFit()
                .frame(width: 48, height: 60)
                .foregroundColor(Color(hex: 0x2D2D2D))
            Text(number)
                .foregroundColor(.white)
                .font(.system(size: 28, weight: .semibold))
        }
    }
    
    private var resendEmailButton: some View {
        Button {
            // TODO: resend email
        } label: {
            Text("authCodeNotReceived")
                .foregroundColor(Color(hex: 0xB8B8B8))
                .underline()
        }
    }
}

struct EmailVerificationPage_Previews: PreviewProvider {
    static var previews: some View {
        EmailVerificationPage()
    }
}
