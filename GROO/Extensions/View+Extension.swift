//
//  View+Extension.swift
//  GROO
//
//  Created by 이예주 on 2023/04/02.
//

import SwiftUI

extension View {
    /// placeholder
    func placeholder<Content: View> (when shouldShow: Bool, alignment: Alignment = .leading, @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
    
    /// specific coner round
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    func colorBorder(_ color: Color = .black, cornerRadius: CGFloat = 0) -> some View {
        modifier(ColorBorder(color, cornerRadius: cornerRadius))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
