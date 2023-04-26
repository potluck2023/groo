//
//  FontExtension.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/26.
//

import SwiftUI

extension Font {
    enum NotoSansKR {
        case black
        case bold
        case light
        case medium
        case regular
        case thin
        case custom(String)
        
        var value: String {
            switch self {
            case .black:
                return "NotoSansKR-Black"
            case .bold:
                return "NotoSansKR-Bold"
            case .light:
                return "NotoSansKR-Light"
            case .medium:
                return "NotoSansKR-Medium"
            case .regular:
                return "NotoSansKR-Regular"
            case .thin:
                return "NotoSansKR-Thin"
            case .custom(let name):
                return name
            
            }
        }
    }
    
    static func notoSansKR(_ type: NotoSansKR, size: CGFloat = 16) -> Font {
        return .custom(type.value, size: size)
    }
}
