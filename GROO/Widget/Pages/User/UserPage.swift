//
//  UserPage.swift
//  GROO
//
//  Created by 이예주 on 2023/05/11.
//

import SwiftUI

struct UserPage: View {
    var body: some View {
        VStack(spacing: 24) {
            header
            profile
            settingMenu
            privateMenu
            Spacer()
        }
    }
    
    private var header: some View {
        Text("myAccount")
            .font(.notoSansKR(.bold, size: 24))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 4)
            .padding(.horizontal, 33)
    }
    
    private var profile: some View {
        Button {
            // TODO: go to profile edit page
        } label: {
            HStack(spacing: 25) {
                Circle()
                    .foregroundColor(Color(hex: 0x3A3A3A))
                    .scaledToFit()
                    .frame(width: 60)
                    .overlay(
                        Text("센")
                            .font(.notoSansKR(.bold, size: 24))
                    )
                VStack(alignment: .leading, spacing: 8) {
                    Text("센이센")
                        .font(.notoSansKR(.bold, size: 20))
                    Text("\("sb05117@gmail.com")")
                        .font(.notoSansKR(.medium, size: 14))
                }
                Spacer()
            }
            .padding(.vertical, 17.5)
            .padding(.horizontal, 26)
            .background(Color(hex: 0x272727))
            .cornerRadius(10)
        }
        .padding(.horizontal, 24)
    }
    
    private var settingMenu: some View {
        VStack(alignment: .leading, spacing: 0) {
            NavigationLink {
                Text("homeSetting")
            } label: {
                buttonlabel("homeSetting")
            }
            ColorDivider(Color(hex: 0x404040))
            Button {
                
            } label: {
                buttonlabel("notice")
            }
            ColorDivider(Color(hex: 0x404040))
            Button {
                
            } label: {
                buttonlabel("sendFeedback")
            }
            ColorDivider(Color(hex: 0x404040))
            Button {
                
            } label: {
                HStack(spacing: 0) {
                    Text("version")
                    Spacer()
                    Text("1.0.0")
                }
                .font(.notoSansKR(.bold, size: 14))
                .padding(.vertical)
                .padding(.horizontal, 26)
                .frame(maxWidth: .infinity, alignment: .leading)
            }

        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(hex: 0x272727))
        )
        .padding(.horizontal, 24)
    }
    
    private var privateMenu: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Button {
                    
                } label: {
                    buttonlabel("logout")
                }
                ColorDivider(Color(hex: 0x404040))
                Button {
                    
                } label: {
                    buttonlabel("withdraw")
                        .foregroundColor(Color(hex: 0xFC5555))
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(hex: 0x272727))
            )
            .padding(.horizontal, 24)
        }
    }
    
    private func buttonlabel(_ text: String) -> some View {
        Text(LocalizedStringKey(text))
            .font(.notoSansKR(.bold, size: 14))
            .padding(.vertical)
            .padding(.horizontal, 26)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct UserPage_Previews: PreviewProvider {
    static var previews: some View {
        UserPage()
            .foregroundColor(Color(hex: 0xEFEFEF))
            .background(Color.background)
    }
}
