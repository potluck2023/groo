//
//  HomePage.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/16.
//

import SwiftUI

enum HomeType: CaseIterable {
    case main
    case list
    
    var icon: String {
        switch self {
        case .main:
            return "main"
        case .list:
            return "list"
        }
    }
}

class HomeViewModel: ObservableObject {
    @Published var homeType: HomeType = .main
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
            
            ScrollView {
                VStack(spacing: 40) {
                    VStack( spacing: 20) {
                        HStack(spacing: 13) {
                            VStack(spacing: 8) {
                                Image("calendar")
                                HStack(spacing: 4) {
                                    Text("\(1)Month")
                                        .font(.notoSansKR(.bold, size: 14))
                                    Image("arrow")
                                }
                            }
                            .foregroundColor(.black)
                            .frame(width: 72, height: 72)
                            .background(Color(hex: 0xEFEFEF))
                            .cornerRadius(9)
                            
                            HStack(alignment: .bottom, spacing: 0) {
                                Text("booksRead")
                                Spacer()
                                Text("178")
                                    .font(.notoSansKR(.bold, size: 28))
                                    .frame(maxHeight: 28)
                                Text("books")
                            }
                            .padding(.vertical, 10)
                            .padding(.trailing, 12)
                            .padding(.leading, 30)
                            .background(Color(hex: 0x434343))
                            .cornerRadius(4, corners: [.topLeft, .bottomLeft])
                            .padding(.vertical, 12)
                            .padding(.leading, 13)
                            .background(Color(hex: 0x272727))
                            .cornerRadius(9)
                            .overlay(
                                Image("bookmark")
                                    .padding(.top, 12)
                                    .padding(.leading, 20),
                                alignment: .topLeading
                            )
                        }
                        
                        HStack(spacing: 14) {
                            VStack(spacing: 12) {
                                HStack(spacing: 0) {
                                    Text("myThought")
                                    Spacer()
                                    Image("arrow")
                                }
                                Text("개인적으로 이 만화를 보면서 책을 사랑하는 마음이 커졌다. 여우와 인간의 이야기를 통해 책이 가지는 매력과 그 중요성을 깨")
                                    .font(.notoSansKR(.medium, size: 14))
                                    .lineLimit(4)
                                    .multilineTextAlignment(.leading)
                                HStack(spacing: 0) {
                                    Text("책먹는 여우")
                                    Spacer()
                                    Text("23/10/21")
                                }
                                .font(.notoSansKR(.medium, size: 14))
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 14)
                            .background(Color(hex: 0x434343))
                            .cornerRadius(9)
                            
                            VStack(spacing: 0) {
                                Text("favoriteGenre")
                                    .font(.notoSansKR(.bold, size: 14))
                                    .padding(.top, 26)
                                Spacer()
                                Text("literature")
                                    .font(.notoSansKR(.bold, size: 28))
                                    .padding(.bottom, 31)
                            }
                            .padding(.horizontal, 10)
                            .background(Color(hex: 0x5679F4))
                            .cornerRadius(9)
                        }
                    }
                    
                    VStack(spacing: 24) {
                        HStack(spacing: 0) {
                            Text("readingBook")
                                .font(.notoSansKR(.bold, size: 20))
                            Spacer()
                            Text("viewAll")
                                .font(.notoSansKR(.medium, size: 16))
                        }
                        
                        RoundedRectangle(cornerRadius: 9)
                            .frame(height: 254)
                            .foregroundColor(Color(hex: 0x272727))
                    }
                    
                    VStack(spacing: 20) {
                        HStack(spacing: 0) {
                            Text("nextReadBook")
                                .font(.notoSansKR(.bold, size: 20))
                            Spacer()
                            Text("viewAll")
                                .font(.notoSansKR(.medium, size: 16))
                        }
                        
                        HStack(spacing: 16) {
                            ForEach(0..<3) { _ in
                                RoundedRectangle(cornerRadius: 9)
                                    .frame(height: 120)
                            }
                        }
                    }
                }
                .padding(.horizontal, 33)
            }
        }
        .foregroundColor(.white)
        .background(Color.background)
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("myLibrary")
            Spacer()
//            homeTypePicker
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
