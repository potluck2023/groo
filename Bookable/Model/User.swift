//
//  User.swift
//  Bookable
//
//  Created by 이예주 on 2023/05/15.
//

struct User: Codable {
    let id: Int
    let email: String
    let password: String?
    let name: String
    let joinDate: String
    
    private enum CodingKeys: String, CodingKey {
        case joinDate
        case id = "userNo"
        case email = "userEmail"
        case password = "userPass"
        case name = "nickname"
    }
    
    init(id: Int = 0, email: String = "", password: String? = nil, name: String = "", joinDate: String = "") {
        self.id = id
        self.email = email
        self.password = password
        self.name = name
        self.joinDate = joinDate
    }
}
