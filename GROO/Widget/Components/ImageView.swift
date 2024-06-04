//
//  ImageView.swift
//  GROO
//
//  Created by isabella joo on 6/4/24.
//

import SwiftUI
import Kingfisher

struct ImageView: View {
    private let imageURL: String
    
    init(for imageURL: String) {
        self.imageURL = imageURL
    }
    
    var body: some View {
        KFImage(URL(string: imageURL))
            .placeholder {
                // TODO: loading...
                ProgressView()
            }
            .resizable()
    }
}

#if DEBUG
#Preview {
    ImageView(for: "https://hips.hearstapps.com/hmg-prod/images/high-angle-view-of-humpback-whale-swimming-in-sea-royalty-free-image-1702574312.jpg")
}
#endif
