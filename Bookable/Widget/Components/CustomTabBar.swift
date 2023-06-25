//
//  CustomTabBar.swift
//  Bookable
//
//  Created by 이예주 on 2023/05/10.
//

import SwiftUI

enum MainTabBar: CaseIterable {
    case home
    case search
    case note
    case user
    
    var icon: String {
        switch self {
        case .home:
            return "home"
        case .search:
            return "search"
        case .note:
            return "note"
        case .user:
            return "user"
        }
    }
}

struct CustomTabBar: View {
    @Binding private var selection: MainTabBar
    
    @State private var needLogin: Bool = false
    
    init(selection: Binding<MainTabBar>) {
        self._selection = selection
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(MainTabBar.allCases, id: \.self) { tab in
                if tab == .user {
                    loginButton(tab)
                } else {
                    button(tab)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(hex: 0x202020))
    }
    
    private func button(_ tab: MainTabBar) -> some View {
        Button {
            selection = tab
        } label: {
            buttonLabel(tab)
        }
    }
    
    private func loginButton(_ tab: MainTabBar) -> some View {
        NavigationLink(destination: LoginPage()) {
            buttonLabel(tab)
        }
    }
    
    private func buttonLabel(_ tab: MainTabBar) -> some View {
        Image(tab.icon)
            .foregroundColor(selection == tab ? Color(hex: 0xEFEFEF) : Color(hex: 0xA2A2A2))
            .padding(.top, 24)
            .padding([.horizontal, .bottom], 28)
            .contentShape(Rectangle())
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selection: .constant(.home))
    }
}
