//
//  BackButton.swift
//  GROO
//
//  Created by isabella joo on 6/4/24.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) private var dismiss
    private let onTap: (() -> Void)?
    
    init(onTap: (() -> Void)? = nil) {
        self.onTap = onTap
    }
    
    var body: some View {
        Image(.back)
            .onTapGesture {
                dismiss()
                onTap?()
            }
    }
}

#Preview {
    BackButton()
}
