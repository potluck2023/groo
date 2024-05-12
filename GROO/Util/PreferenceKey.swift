//
//  PreferenceKey.swift
//  GROO
//
//  Created by 이예주 on 2023/09/19.
//

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
