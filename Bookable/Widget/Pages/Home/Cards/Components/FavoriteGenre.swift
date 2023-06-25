//
//  FavoriteGenre.swift
//  Bookable
//
//  Created by 이예주 on 2023/05/11.
//

import SwiftUI

enum BookGenre {
    case generalWorks
    case philosophy
    case religion
    case socialScience
    case science
    case technology
    case arts
    case language
    case literature
    case history
    
    var label: String {
        switch self {
        case .generalWorks:
            return "generalWorks"
        case .philosophy:
            return "philosophy"
        case .religion:
            return "religion"
        case .socialScience:
            return "socialScience"
        case .science:
            return "science"
        case .technology:
            return "technology"
        case .arts:
            return "arts"
        case .language:
            return "language"
        case .literature:
            return "literature"
        case .history:
            return "history"
        }
    }
    
    var fontColor: Color {
        switch self {
        case .generalWorks:
            return .white
        case .philosophy:
            return .white
        case .religion:
            return .white
        case .socialScience:
            return .white
        case .science:
            return .white
        case .technology:
            return .white
        case .arts:
            return .white
        case .language:
            return .white
        case .literature:
            return .white
        case .history:
            return .white
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .generalWorks:
            return Color(hex: 0x5679F4)
        case .philosophy:
            return Color(hex: 0x5679F4)
        case .religion:
            return Color(hex: 0x5679F4)
        case .socialScience:
            return Color(hex: 0x5679F4)
        case .science:
            return Color(hex: 0x5679F4)
        case .technology:
            return Color(hex: 0x5679F4)
        case .arts:
            return Color(hex: 0x5679F4)
        case .language:
            return Color(hex: 0x5679F4)
        case .literature:
            return Color(hex: 0x5679F4)
        case .history:
            return Color(hex: 0x5679F4)
        }
    }
    
    var borderColor: Color {
        switch self {
        case .generalWorks:
            return Color(hex: 0x3A5BCE)
        case .philosophy:
            return Color(hex: 0x3A5BCE)
        case .religion:
            return Color(hex: 0x3A5BCE)
        case .socialScience:
            return Color(hex: 0x3A5BCE)
        case .science:
            return Color(hex: 0x3A5BCE)
        case .technology:
            return Color(hex: 0x3A5BCE)
        case .arts:
            return Color(hex: 0x3A5BCE)
        case .language:
            return Color(hex: 0x3A5BCE)
        case .literature:
            return Color(hex: 0x3A5BCE)
        case .history:
            return Color(hex: 0x3A5BCE)
        }
    }
}

struct FavoriteGenre: View {
    @Binding private var genre: BookGenre
    
    init(genre: Binding<BookGenre>) {
        self._genre = genre
    }
    
    var body: some View {
        VStack(spacing: 0) {
            border(height: 8)
            Text("favoriteGenre")
                .font(.notoSansKR(.bold, size: 14))
                .padding(.vertical, 5)
            border(height: 8)
            
            Spacer()
            Text(LocalizedStringKey(genre.label))
                .font(.notoSansKR(.bold, size: 28))
                .padding(.horizontal, 2)
                .frame(minHeight: 28)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .padding(.bottom, 3)
            border(height: 16)
        }
        .foregroundColor(genre.fontColor)
        .padding(.vertical, 12)
        .background(genre.backgroundColor)
        .cornerRadius(9)
        .frame(maxWidth: 76)
    }
    
    private func border(height: CGFloat) -> some View {
        Rectangle()
            .frame(height: height)
            .foregroundColor(genre.borderColor)
    }
}

struct FavoriteGenre_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteGenre(genre: .constant(.socialScience))
            .previewLayout(.sizeThatFits)
    }
}
