//
//  PullToRefreshView.swift
//  GROO
//
//  Created by isabella joo on 6/4/24.
//

import SwiftUI

struct PullToRefreshView: View {
    private let coordinateSpaceName: String
    private let offsetY: CGFloat
    private let onRefresh: () -> Void
    
    @State private var needRefresh: Bool = false
    
    init(
        _ coordinateSpaceName: String,
        offsetY: CGFloat = -60,
        onRefresh: @escaping () -> Void
    ) {
        self.coordinateSpaceName = coordinateSpaceName
        self.offsetY = offsetY
        self.onRefresh = onRefresh
    }
    var body: some View {
        GeometryReader { reader in
            Group {
                if reader.frame(in: .named(coordinateSpaceName)).minY > 0 {
                    Spacer()
                        .frame(height: 1)
                        .task {
                            needRefresh = true
                        }
                } else if reader.frame(in: .named(coordinateSpaceName)).minY < 5 {
                    Spacer()
                        .frame(height: 1)
                        .task {
                            if needRefresh {
                                needRefresh = false
                                onRefresh()
                            }
                        }
                }
            }
            
            ProgressView()
                .frame(maxWidth: .infinity)
        }
        .padding(.top, offsetY)
    }
}

#if DEBUG
#Preview {
    ScrollView {
        VStack(spacing: 0) {
            PullToRefreshView("PullToRefreshView", onRefresh: { })
                .background(.yellow)
            
            LazyVStack {
                ForEach(1...10, id: \.self) { count in
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.gray)
                        .frame(height: 200)
                        .padding()
                }
            }
            .background(.gray.opacity(0.3))
        }
    }
}
#endif
