//
//  HomePage.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/16.
//

import SwiftUI

struct Main: View {
    @State private var selection: MainTabBar = .home
    
    var body: some View {
        VStack(spacing: 0) {
            switch selection {
            case .home:
                HomePage()
            case .search:
                Text("search")
            case .note:
                Text("note")
            case .user:
                Text("user")
            }
            CustomTabBar(selection: $selection)
        }
        .font(.notoSansKR(.medium))
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
