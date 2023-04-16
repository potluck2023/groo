//
//  AgreementPage.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/02.
//

import SwiftUI

class AgreementViewModel: ObservableObject {
    
}

struct AgreementPage: View {
    @StateObject private var viewModel = AgreementViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            
            Text("welcome000")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 49)
                .padding(.horizontal, 12)
            Spacer()
            
            HStack(spacing: 0) {
                Text("allAgreement")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.white)
                Spacer()
                
                checkBox
            }
            .frame(height: 59)
            
            HStack(spacing: 16) {
                Text("required")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color.white)
                Text("termsOfService")
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: 0xCDCDCD))
                Spacer()
                checkBox
            }
            .frame(height: 59)
            
            HStack(spacing: 16) {
                Text("required")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color.white)
                Text("privacyPolicy")
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: 0xCDCDCD))
                Spacer()
                checkBox
            }
            .frame(height: 59)
            
            Spacer()
            
            Button {
                // TODO: next
            } label: {
                Text("next")
                    .font(.system(size: 16, weight: .semibold))
            }
            .buttonStyle(RoundedButtonStyle(fontColor: Color(hex: 0x757575), backgroundColor: Color(hex:0x3A3A3A)))
            .padding(.horizontal, 12)
        }
        .padding(.horizontal, 44)
        .background(Color.background)
    }
    
    private var checkBox: some View {
        RoundedRectangle(cornerRadius: 2)
            .strokeBorder(Color(hex: 0xCDCDCD), lineWidth: 2)
            .frame(width: 16, height: 16)
    }
}

struct AgreementPage_Previews: PreviewProvider {
    static var previews: some View {
        AgreementPage()
    }
}
