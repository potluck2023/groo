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
    
    /// view size
    func readSize<K>(preference: K.Type, completionHandler: @escaping (CGSize) -> Void) -> some View where K : PreferenceKey {
        self
            .background(
                GeometryReader { proxy in
                    if let value = proxy.size as? K.Value {
                        Color.clear
                            .preference(key: K.self, value: value)
                    }
                }
            )
            .onPreferenceChange(SizePreferenceKey.self) { newSize in
                _ = completionHandler(newSize)
            }
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
