//
//  ColorBorder.swift
//  GROO
//
//  Created by 이예주 on 2023/07/17.
//

import SwiftUI

struct ColorBorder: ViewModifier {
    private let color: Color
    private let cornerRadius: CGFloat
    private let lineWidth: CGFloat?
    private let style: StrokeStyle?
    
    init(_ color: Color = .black, cornerRadius: CGFloat = 5, lineWidth: CGFloat = 1) {
        self.color = color
        self.cornerRadius = cornerRadius
        self.lineWidth = lineWidth
        self.style = nil
    }
    
    init(_ color: Color = .black, cornerRadius: CGFloat = 5, style: StrokeStyle) {
        self.color = color
        self.cornerRadius = cornerRadius
        self.lineWidth = nil
        self.style = style
    }
    
    func body(content: Content) -> some View {
        if lineWidth != nil {
            content
                .overlay(line)
        } else if style != nil {
            content
                .overlay(dash)
        }
    }
    
    @ViewBuilder
    private var line: some View {
        if let lineWidth {
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(color, lineWidth: lineWidth)
        }
    }
    
    @ViewBuilder
    private var dash: some View {
        if let style {
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(color, style: style)
        }
    }
}
