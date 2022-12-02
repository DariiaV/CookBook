//
//  CookBook.swift
//  CookBook
//
//  Created by Александр Косяков on 29.11.2022.
//

import Foundation

// MARK: - CookBookElement

struct CookBookElement:Decodable {
        var id: Int?
        var title: String?
        var image: String?
        var imageTipe: String?
//        let extendedIngredients: [Ingredient]
    }

//    struct Ingredient: Decodable {
//        let name: String
//
//    }

    



typealias CookBook = [CookBookElement]


