//
//  ResponseCategory.swift
//  MojadiApp
//
//  Created by yoga arie on 18/05/22.
//

import Foundation


// MARK: - ResponseCategory
struct ResponseCategory: Codable {
    let status: Int
    let message: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let categoryName: String

    enum CodingKeys: String, CodingKey {
        case id
        case categoryName = "category_name"
        
    }
}



