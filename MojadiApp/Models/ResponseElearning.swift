//
//  ResponseElearning.swift
//  MojadiApp
//
//  Created by yoga arie on 30/06/22.
//

import Foundation

// MARK: - ResponseElearning
struct ResponseElearning: Codable {
    let status: Int
    let message: String
    let data: [Elearning]
}

// MARK: - Datum
struct Elearning: Codable {
    let id, idCourse: Int
    let moduleTitle, moduleOverview: String

    enum CodingKeys: String, CodingKey {
        case id
        case idCourse = "id_course"
        case moduleTitle = "module_title"
        case moduleOverview = "module_overview"
    }
}
