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
            
            Text("000에 오신 것을\n 환영합니다")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 49)
                .padding(.horizontal, 12)
            Spacer()
            
            HStack(spacing: 0) {
                Text("전체동의")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.white)
                Spacer()
                
                checkBox
            }
            .frame(height: 59)
            
            HStack(spacing: 16) {
                Text("필수")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color.white)
                Text("서비스 이용약관 >")
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: 0xCDCDCD))
                Spacer()
                checkBox
            }
            .frame(height: 59)
            
            HStack(spacing: 16) {
                Text("필수")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color.white)
                Text("개인정보 수집 및 이용동의 >")
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
                Text("다음")
                    .foregroundColor(Color(hex: 0x757575))
                    .font(.system(size: 16, weight: .semibold))
                    .frame(height: 46)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 40).fill(Color(hex: 0x3A3A3A)))
            }
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
