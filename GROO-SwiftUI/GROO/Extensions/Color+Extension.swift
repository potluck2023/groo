//
//  Color+Extension.swift
//  GROO
//
//  Created by 이예주 on 2023/04/02.
//

import SwiftUI

extension Color {
    /// hex color
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
    
    /// custom color
    static let background = Color("background")
}
