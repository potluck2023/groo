//
//  Book.swift
//  GROO
//
//  Created by 이예주 on 2023/07/18.
//

import Foundation

struct Book: Codable, Hashable {
    let id: UUID = UUID()
    let title: String
    let image: String
    let authors: String
    let publisher: String
    let publicationYear: String
    let isbn: String
    
    private enum CodingKeys: String, CodingKey {
        case authors, publisher
        case title = "bookname"
        case publicationYear = "publication_year"
        case isbn = "isbn13"
        case image = "bookImageURL"
    }
}

struct BookList {
    let totalCount: Int
    let contents: [Book]
}

struct Doc: Codable {
    let doc: Book
}

struct Docs: Codable {
    let numFound: Int
    let docs: [Doc]
    
    private enum CodingKeys: String, CodingKey {
        case numFound, docs
    }
}

struct LibraryResponse: Codable {
    let response: Docs
    
    private enum CodingKeys: String, CodingKey {
        case response
    }
}
