//
//  String+Extension.swift
//  GROO
//
//  Created by 이예주 on 2023/05/10.
//

import Foundation

extension String {
    /// justify
    func useNonBreakingSpace() -> String {
        self.replacingOccurrences(of: " ", with: "\u{202F}\u{202F}")
    }
}
