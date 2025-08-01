//
//  Font+Extension.swift
//  GROO
//
//  Created by 이예주 on 2023/04/26.
//

import SwiftUI

extension Font {
    enum NotoSansKR {
        case black
        case extraBold
        case bold
        case semibold
        case medium
        case regular
        case light
        case extraLight
        case thin
        case custom(String)
        
        var value: String {
            switch self {
            case .black:
                return "NotoSansKR-Black"
            case .extraBold:
                return "NotoSansKR-ExtraBold"
            case .bold:
                return "NotoSansKR-Bold"
            case .semibold:
                return "NotoSansKR-SemiBold"
            case .medium:
                return "NotoSansKR-Medium"
            case .regular:
                return "NotoSansKR-Regular"
            case .extraLight:
                return "NotoSansKR-ExtraLight"
            case .light:
                return "NotoSansKR-Light"
            case .thin:
                return "NotoSansKR-Thin"
            case let .custom(name):
                return name
            }
        }
    }
    
    static func notoSansKR(_ type: NotoSansKR, size: CGFloat = 16) -> Font {
        return .custom(type.value, size: size)
    }
}
