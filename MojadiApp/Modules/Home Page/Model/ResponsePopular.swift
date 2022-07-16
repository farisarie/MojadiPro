

import Foundation

// MARK: - ResponseWebinar
struct ResponsePopular: Codable {
    let status: Int
    let message: String
    let data: [Popular]
}

// MARK: - Datum
struct Popular: Codable {
    let id: Int
    let name, datumDescription: String
    let photoURL: String
    let averageRate: JSONNull?
    let price: Int
    let totalRate: JSONNull?
    let totalDuration: Double
    let currentParticipant, maximumParticipant, courseStart, courseFinish: JSONNull?
    let expertName, statusName: String
    let idExpert, idStatus: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case datumDescription = "description"
        case photoURL = "photo_url"
        case averageRate = "average_rate"
        case price
        case totalRate = "total_rate"
        case totalDuration = "total_duration"
        case currentParticipant = "current_participant"
        case maximumParticipant = "maximum_participant"
        case courseStart = "course_start"
        case courseFinish = "course_finish"
        case expertName = "expert_name"
        case statusName = "status_name"
        case idExpert = "id_expert"
        case idStatus = "id_status"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

