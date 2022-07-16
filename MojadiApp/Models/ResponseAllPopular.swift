//
//  ResponseAllPopular.swift
//  MojadiApp
//
//  Created by yoga arie on 05/07/22.
//

import Foundation


// MARK: - ResponsePopular
struct ResponseAllPopular: Codable {
    let status: Int
    let message: String
    let data: [AllPopular]
}

// MARK: - Datum
struct AllPopular: Codable {
    let id, idExpert: Int
    let name, datumDescription: String
    let photoURL: String
    let averageRate, price, totalRate: Int
    let totalDuration: Double
    let currentParticipant, maximumParticipant: Int
    let courseStart, courseFinish: String
    let idStatus: Int
    let expertName: String
    let statusName: StatusName

    enum CodingKeys: String, CodingKey {
        case id
        case idExpert = "id_expert"
        case name
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
        case idStatus = "id_status"
        case expertName = "expert_name"
        case statusName = "status_name"
    }
}

enum StatusName: String, Codable {
    case ongoing = "ongoing"
}
