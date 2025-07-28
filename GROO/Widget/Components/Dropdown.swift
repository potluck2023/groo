//
//  DropDown.swift
//  GROO
//
//  Created by 이예주 on 2023/07/17.
//

import SwiftUI

protocol DropdownMenu: Hashable, CaseIterable {
    var label: LocalizedStringKey { get }
}

struct DropdownView<T: DropdownMenu>: View {
    @Binding private var selection: T
    private let options: [T]
    
    private let maxWidth: CGFloat
    
    @State private var showOptions: Bool = false
    
    init(
        selection: Binding<T>,
        options: [T],
        maxWidth: CGFloat = 86
    ) {
        _selection = selection
        self.options = options
        self.maxWidth = maxWidth
    }
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 2) {
                HStack(spacing: 0) {
                    Text(selection.label)
                        .font(.notoSansKR(.medium, size: 14))
                        .frame(minHeight: 19)
                        .lineLimit(1)
                        .fixedSize()
                    
                    Spacer(minLength: 0)
                    
                    Image(.chevronDown)
                        .rotationEffect(.init(degrees: showOptions ? -180 : 0))
                }
                .foregroundStyle(Color(hex: 0xEFEFEF))
                .padding(.horizontal, 16)
                .frame(height: 35)
                .background(Color(hex: 0x333333), in: .capsule)
                .frame(minWidth: size.width)
                .frame(height: size.height)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy) {
                        showOptions.toggle()
                    }
                }
                .zIndex(10)
                
                if showOptions {
                    optionList
                }
            }
            .clipped()
        }
        .frame(width: maxWidth, height: 35)
    }
    
    private var optionList: some View {
        VStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                HStack(spacing: 0) {
                    Text(option.label)
                        .font(.notoSansKR(.medium, size: 14))
                        .frame(minHeight: 19)
                        .lineLimit(1)
                    
                    Spacer(minLength: 0)
                    
                    // TODO: checkmark
                    Image(systemName: "checkmark")
                        .frame(width: 12, height: 12)
                        .font(.caption)
                        .opacity(selection == option ? 1 : 0)
                }
                .foregroundStyle(Color(hex: 0xEFEFEF))
                .animation(.none, value: selection)
                .frame(height: 35)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy) {
                        selection = option
                        showOptions = false
                    }
                }
            }
        }
        .padding(.horizontal, 15)
        .background(Color(hex: 0x333333), in: .rect(cornerRadius: 10))
        .transition(.move(edge: .top))
    }
}

#if DEBUG
#Preview {
    DropdownView(selection: .constant(BookSearchType.title), options: BookSearchType.allCases, maxWidth: 86)
}
#endif
