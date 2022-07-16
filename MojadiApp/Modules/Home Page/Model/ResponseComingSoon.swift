import Foundation

// MARK: - ResponseComingSoon
struct ResponseComingSoon: Codable {
    let status: Int
    let message: String
    let data: [ComingSoon]
}

// MARK: - Datum
struct ComingSoon: Codable {
    let id: Int
    let name, datumDescription: String
    let cover: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case datumDescription = "description"
        case cover
    }
}
