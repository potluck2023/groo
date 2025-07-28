//
//  ButtonStyle.swift
//  GROO
//
//  Created by 이예주 on 2023/04/16.
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    private var minHeight: CGFloat
    private var verticalPadding: CGFloat
    private var horizontalPadding: CGFloat
    private var fontColor: Color
    private var backgroundColor: Color
    private var cornerRadius: CGFloat
    
    init(minHeight: CGFloat = 46,
         verticalPadding: CGFloat = 0,
         horizontalPadding: CGFloat = 0,
         fontColor: Color = Color(hex: 0x202020),
         backgroundColor: Color = .white,
         cornerRadius: CGFloat = 40) {
        self.minHeight = minHeight
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.fontColor = fontColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(fontColor)
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
            .frame(maxWidth: .infinity, minHeight: minHeight)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
    }
}

struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            Button("RoundedButtonStyle") {
                
            }
            .buttonStyle(RoundedButtonStyle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}
