// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let responseComingSoon = try? newJSONDecoder().decode(ResponseComingSoon.self, from: jsonData)

import Foundation

// MARK: - ResponseComingSoon
struct ResponseDetail: Codable {
    let status: Int
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id, idExpert: Int
    let name, dataDescription: String
    let photoURL: String
    let averageRate, price, totalRate: Int
    let totalDuration: Double
    let currentParticipant, maximumParticipant: Int
    let courseStart, courseFinish: String
    let idStatus: Int
    let contents: String
    let alreadyOwned: Bool
    let expert: Expert

    enum CodingKeys: String, CodingKey {
        case id
        case idExpert = "id_expert"
        case name
        case dataDescription = "description"
        case photoURL = "photo_url"
        case averageRate = "average_rate"
        case price
        case totalRate = "total_rate"
        case totalDuration = "total_duration"
        case currentParticipant = "current_participant"
        case maximumParticipant = "maximum_participant"
        case courseStart = "course_start"
        case courseFinish = "course_finish"
        case idStatus = "id_status"
        case contents
        case alreadyOwned = "already_owned"
        case expert
    }
}

// MARK: - Expert
struct Expert: Codable {
    let id: Int
    let fullName, profileDescription, phone, address: String
    let gender, dateBirth: String
    let photo: String
    let averageRate, totalStudent: Int

    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case profileDescription = "profile_description"
        case phone, address, gender
        case dateBirth = "date_birth"
        case photo
        case averageRate = "average_rate"
        case totalStudent = "total_student"
    }
}
