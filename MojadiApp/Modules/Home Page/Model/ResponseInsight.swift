// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let responseComingSoon = try? newJSONDecoder().decode(ResponseComingSoon.self, from: jsonData)

import Foundation

// MARK: - ResponseComingSoon
struct ResponseInsight: Codable {
    let status: Int
    let message: String
    let data: [Insight]
}

// MARK: - Datum
struct Insight: Codable {
    let id, idUserAuthor: Int
    let titleInsight: String
    let coverInsight: String
    let bodyContent: String

    enum CodingKeys: String, CodingKey {
        case id
        case idUserAuthor = "id_user_author"
        case titleInsight = "title_insight"
        case coverInsight = "cover_insight"
        case bodyContent = "body_content"
    }
}
