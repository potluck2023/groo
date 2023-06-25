//
//  HomePage.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/16.
//

import SwiftUI

enum HomeType: CaseIterable {
    case card
    case book
    
    var icon: String {
        switch self {
        case .card:
            return "cards"
        case .book:
            return "books"
        }
    }
}

class HomeViewModel: ObservableObject {
    @Published var homeType: HomeType = .card
}

struct HomePage: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        Group {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    content
                }
            } else {
                NavigationView {
                    content
                }
            }
        }
        .font(.notoSansKR(.bold))
    }
    
    private var content: some View {
        VStack(spacing: 32) {
            header
                .padding(.top, 32)
            
            switch viewModel.homeType {
            case .card:
                CardView()
            case .book:
                BooksView()
            }
        }
        .foregroundColor(.white)
        .background(Color.background)
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

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
