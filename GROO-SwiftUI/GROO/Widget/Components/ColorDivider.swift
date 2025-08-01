//
//  ColorDivider.swift
//  GROO
//
//  Created by 이예주 on 2023/07/17.
//

import SwiftUI

struct ColorDivider: View {
    private var color: Color
    private var height: CGFloat
    
    init(_ color: Color, height: CGFloat = 1) {
        self.color = color
        self.height = height
    }
    
    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .foregroundColor(color)
    }
}
