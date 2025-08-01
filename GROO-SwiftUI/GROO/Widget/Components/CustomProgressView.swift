//
//  CustomProgressView.swift
//  GROO
//
//  Created by isabella joo on 6/4/24.
//

import SwiftUI

struct CustomProgressView: View {
    private let onLoading: () -> Void
    
    init(_ onLoading: @escaping () -> Void) {
        self.onLoading = onLoading
    }
    
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(.clear)
            .frame(maxWidth: .infinity)
            .task {
                onLoading()
            }
    }
}
