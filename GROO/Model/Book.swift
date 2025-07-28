//
//  Book.swift
//  GROO
//
//  Created by 이예주 on 2023/07/18.
//

import Foundation

struct Book: Codable, Hashable {
    let id: UUID
    let title: String
    let imageURL: String
    let authors: String
    let publisher: String
    let publicationYear: String
    let isbn: String
    
    init(
        id: UUID = .init(),
        title: String = "",
        imageURL: String = "",
        authors: String = "",
        publisher: String = "",
        publicationYear: String = "",
        isbn: String = ""
    ) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.authors = authors
        self.publisher = publisher
        self.publicationYear = publicationYear
        self.isbn = isbn
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
