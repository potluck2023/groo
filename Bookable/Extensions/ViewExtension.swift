//
//  ViewExtension.swift
//  Bookable
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
}
