//
//  HomePage.swift
//  GROO
//
//  Created by 이예주 on 2023/04/16.
//

import SwiftUI

struct Main: View {
    @State private var selection: MainTabBar = .home
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                content
            }
        } else {
            NavigationView {
                content
            }
        }
    }
    
    private var content: some View {
        VStack(spacing: 0) {
            switch selection {
            case .home:
                HomePage()
            case .search:
                SearchPage()
            case .note:
                RecordPage()
            case .user:
                UserPage()
            }
            CustomTabBar(selection: $selection)
        }
        .font(.notoSansKR(.medium))
        .foregroundColor(Color(hex: 0xEFEFEF))
        .background(Color.background)
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}