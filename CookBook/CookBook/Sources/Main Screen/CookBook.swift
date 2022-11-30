//
//  CookBook.swift
//  CookBook
//
//  Created by Александр Косяков on 29.11.2022.
//

import Foundation

// MARK: - CookBookElement
struct CookBookElement: Codable {
    let userID, id: Int?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}

struct id: Decodable {
        let image: String?
        let imageType: String?

}

typealias CookBook = [CookBookElement]

