//
//  ResponseSearchSoon.swift
//  MojadiApp
//
//  Created by yoga arie on 05/07/22.
//

import Foundation



// MARK: - ResponseSearchSoon
struct ResponseSearchSoon: Codable {
    let status: Int
    let message: String
    let data: [Search]
}

// MARK: - Datum
struct Search: Codable {
    let id: Int
    let name, datumDescription: String
    let cover: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case datumDescription = "description"
        case cover
    }
}
