//
//  DropDown.swift
//  GROO
//
//  Created by 이예주 on 2023/07/17.
//

import SwiftUI

struct Dropdown<Content: View>: View {
    var borderColor: Color = Color(hex: 0xEFEFEF)
    var backgroundColor: Color = .clear
    @ViewBuilder var content: Content
    
    var body: some View {
        CustomButton(verticalPadding: 8, backgroundColor: backgroundColor, borderColor: borderColor) {
            content
        } onAction: {
            
        }
    }
}
