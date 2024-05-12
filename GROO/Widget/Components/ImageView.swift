//
//  ImageView.swift
//  GROO
//
//  Created by 이예주 on 2023/08/14.
//

import SwiftUI
import NukeUI

struct ImageView<Content: View>: View {
    let imageUrl: String
    let resizingMode: ImageResizingMode
    let errorImage: Content
    
    init(imageUrl: String, resizingMode: ImageResizingMode = .aspectFit, @ViewBuilder errorImage: () -> Content) {
        self.imageUrl = imageUrl
        self.resizingMode = resizingMode
        self.errorImage = errorImage()
    }
    
    var body: some View {
        LazyImage(url: URL(string: imageUrl)) { state in
            if let container = state.imageContainer {
                state.image?
                    .resizingMode(resizingMode)
            } else if state.error != nil {
                errorImage
                    .onAppear {
                        Log(state.error)
                    }
            } else {
                errorImage
            }
        }
        .background(Color.white)
    }
}

extension ImageView where Content == Color {
    init(imageUrl: String) {
        self.init(imageUrl: imageUrl) {
            Color.clear
        }
    }
}
