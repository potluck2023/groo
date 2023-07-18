//
//  UIApplication+Extension.swift
//  GROO
//
//  Created by 이예주 on 2023/07/17.
//

import UIKit

extension UIApplication {
    // 프레임 가로 길이
    public var frameWidth: CGFloat {
        guard let firstScene = self.connectedScenes.first as? UIWindowScene else { return 0 }
        guard let window = firstScene.windows.first else { return 0 }
        return window.frame.width
    }
    
    public var frameHeight: CGFloat {
        guard let firstScene = self.connectedScenes.first as? UIWindowScene else { return 0 }
        guard let window = firstScene.windows.first else { return 0 }
        return window.frame.height
    }
}
