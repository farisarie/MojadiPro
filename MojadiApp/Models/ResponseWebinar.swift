// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let responseWebinar = try? newJSONDecoder().decode(ResponseWebinar.self, from: jsonData)

import Foundation

// MARK: - ResponseWebinar
struct ResponseWebinar: Codable {
    let status: Int
    let message: String
    let data: [Webinar]
}

// MARK: - Datum
struct Webinar: Codable {
    let id, idCourse: Int
    let title: String
    let cover: String
    let scheduleDay, scheduleDate, timeStart, timeFinish: String

    enum CodingKeys: String, CodingKey {
        case id
        case idCourse = "id_course"
        case title, cover
        case scheduleDay = "schedule_day"
        case scheduleDate = "schedule_date"
        case timeStart = "time_start"
        case timeFinish = "time_finish"
    }
}
