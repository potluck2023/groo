//
//  HomePage.swift
//  GROO
//
//  Created by 이예주 on 2023/04/16.
//

import SwiftUI

struct Main: View {
    @State private var selection: MainTabBar
    
    init(selection: MainTabBar = .home) {
        _selection = .init(initialValue: selection)
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomePage()
                .tag(MainTabBar.home)
                .tabItem { tabItem(.home) }
            
            SearchPage()
                .tag(MainTabBar.search)
                .tabItem { tabItem(.search) }
            
            RecordPage()
                .tag(MainTabBar.note)
                .tabItem { tabItem(.note) }
            
            UserPage()
                .tag(MainTabBar.user)
                .tabItem { tabItem(.user) }
        }
    }
    
    private func tabItem(_ tab: MainTabBar) -> some View {
        Image(tab.icon)
            .foregroundStyle(selection == tab ? Color(hex: 0xEFEFEF) : Color(hex: 0xA2A2A2))
    }
}

#Preview {
    Main()
}
