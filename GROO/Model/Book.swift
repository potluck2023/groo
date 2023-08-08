//
//  Book.swift
//  GROO
//
//  Created by 이예주 on 2023/07/18.
//

import Foundation

struct Book: Codable {
    let id: UUID = UUID()
    let title: String
    let link: String
    let image: String
    let author: String
    let discount: String
    let publisher: String
    let pubdate: String
    let isbn: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case title, link, image, author, discount, publisher, pubdate, isbn, description
    }
}

struct BookList: Codable {
    let lastBuildDate: String
    let total: Int
    let start: Int
    let display: Int
    let items: [Book]
    
    private enum CodingKeys: String, CodingKey {
        case lastBuildDate, total, start, display, items
    }
}
