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

struct HomePage: View {
    @State private var homeType: HomeType = .main
    
    var body: some View {
        Group {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    content
                }
            } else {
                // Fallback on earlier versions
                NavigationView {
                    content
                }
            }
        }
    }
    
    private var content: some View {
        VStack(spacing: 32) {
            header
            
            ScrollView {
                VStack(spacing: 40) {
                    VStack( spacing: 20) {
                        HStack(spacing: 13) {
                            VStack(spacing: 0) {
                                Text("month")
                                Text("1개월 >")
                            }
                            .foregroundColor(.black)
                            .frame(width: 72, height: 72)
                            .background(Color(hex: 0xEFEFEF))
                            .cornerRadius(9)
                            
                            HStack(spacing: 0) {
                                Text("읽은 책")
                                Spacer()
                                Text("178권")
                            }
                            .padding(.vertical, 10)
                            .padding(.trailing, 12)
                            .padding(.leading, 30)
                            .background(Color(hex: 0x434343))
                            .cornerRadius(9, corners: [.topLeft, .bottomLeft])
                            .padding(.vertical, 12)
                            .padding(.leading, 13)
                            .background(Color(hex: 0x272727))
                            .cornerRadius(9)
                        }
                        
                        HStack(spacing: 14) {
                            VStack(spacing: 12) {
                                HStack(spacing: 0) {
                                    Text("나의 생각")
                                    Spacer()
                                    Text(">")
                                }
                                Text("개인적으로 이 만화를 보면서 책을 사랑하는 마음이 커졌다. 여우와 인간의 이야기를 통해 책이 가지는 매력과 그 중요성을 깨")
                                    .lineLimit(4)
                                    .multilineTextAlignment(.leading)
                                HStack(spacing: 0) {
                                    Text("책먹는 여우")
                                    Spacer()
                                    Text("23/10/21")
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 14)
                            .background(Color(hex: 0x434343))
                            .cornerRadius(9)
                            
                            VStack(spacing: 0) {
                                Text("선호 장르")
                                    .padding(.top, 26)
                                Spacer()
                                Text("문학")
                                    .padding(.bottom, 31)
                            }
                            .padding(.horizontal, 10)
                            .background(Color(hex: 0x5679F4))
                            .cornerRadius(9)
                        }
                    }
                    
                    VStack(spacing: 24) {
                        HStack(spacing: 0) {
                            Text("읽고 있는 책")
                            Spacer()
                            Text("전체 보기")
                        }
                        
                        RoundedRectangle(cornerRadius: 9)
                            .frame(height: 254)
                            .foregroundColor(Color(hex: 0x272727))
                    }
                    
                    VStack(spacing: 20) {
                        HStack(spacing: 0) {
                            Text("다음에 읽을 책")
                            Spacer()
                            Text("전체 보기")
                        }
                        
                        HStack(spacing: 16) {
                            ForEach(0..<3) { _ in
                                RoundedRectangle(cornerRadius: 9)
                                    .frame(height: 120)
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 33)
        .foregroundColor(.white)
        .background(Color.background)
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("내 서재")
            Spacer()
            homeTypePicker
        }
    }
    
    private var homeTypePicker: some View {
        Picker("", selection: $homeType) {
            ForEach(HomeType.allCases, id: \.self) { type in
                Text(type.icon)
            }
        }
        .pickerStyle(.segmented)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
