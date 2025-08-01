//
//  HomePage.swift
//  GROO
//
//  Created by 이예주 on 2023/04/16.
//

import SwiftUI

enum HomeType: CaseIterable {
    case card
    case bookshelf
    
    var icon: String {
        switch self {
        case .card:
            return "cards"
        case .bookshelf:
            return "books"
        }
    }
}

class HomeViewModel: ObservableObject {
    @Published var homeType: HomeType = .card
}

struct HomePage: View {
    @StateObject private var pathModel: PathModel
    @StateObject private var viewModel: HomeViewModel
    
    init(
        pathModel: PathModel = .init(),
        viewModel: HomeViewModel = .init()
    ) {
        _pathModel = .init(wrappedValue: pathModel)
        _viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack(path: $pathModel.paths) {
            VStack(spacing: 0) {
                header
                    .padding(.top, 32)
                
                switch viewModel.homeType {
                case .card:
                    CardView()
                        .padding(.top, 32)
                case .bookshelf:
                    BookshelfView()
                        .padding(.top, 24)
                }
            }
            .foregroundStyle(.white)
            .background(Color.background)
        }
        .font(.notoSansKR(.bold))
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("myLibrary")
            Spacer()
            HomeToggle(selection: $viewModel.homeType)
        }
        .font(.notoSansKR(.bold, size: 24))
        
        .padding(.horizontal, 33)
    }
    
//    private var homeTypePicker: some View {
//        Picker("", selection: $viewModel.homeType) {
//            ForEach(HomeType.allCases, id: \.self) { type in
//                Text(type.icon)
//            }
//        }
//        .pickerStyle(.segmented)
//    }
}

#Preview {
    HomePage()
}
