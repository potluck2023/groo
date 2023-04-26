//
//  HomePage.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/16.
//

import SwiftUI

struct Main: View {
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Text("Home")
                }
        }
        .font(.notoSansKR(.medium))
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
