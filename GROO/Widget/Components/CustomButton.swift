//
//  CustomButton.swift
//  GROO
//
//  Created by 이예주 on 2023/05/30.
//

import SwiftUI

struct CustomButton<Label: View>: View {
    var verticalPadding: CGFloat = 8.5
    var horizontalPadding: CGFloat = 16
    var foregroundColor: Color = Color(hex: 0xEFEFEF)
    var backgroundColor: Color = .clear
    var borderColor: Color = Color(hex: 0xEFEFEF)
    var cornerRadius: CGFloat = 20
    @ViewBuilder var label: Label
    var onAction: () -> Void
    
    var body: some View {
        Button {
            onAction()
        } label: {
            label
                .foregroundColor(foregroundColor)
                .padding(.vertical, verticalPadding)
                .padding(.horizontal, horizontalPadding)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
                .modifier(ColorBorder(borderColor, cornerRadius: cornerRadius))
                .contentShape(Rectangle())
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton {
            Text("recordBook")
        } onAction: {
            
        }
    }
}
