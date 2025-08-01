//
//  SearchDetailPage.swift
//  GROO
//
//  Created by isabella joo on 6/4/24.
//

import SwiftUI

struct SearchDetailPage: View {
    
    
    var body: some View {
        VStack(spacing: 0) {
            
        }
        .navigationBarBackButtonHidden()
        .background(Color(hex: 0x202020))
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton()
            }
        }
        .navigationTitle("bookDetail")
    }
}

#if DEBUG
#Preview {
    SearchDetailPage()
}
#endif
