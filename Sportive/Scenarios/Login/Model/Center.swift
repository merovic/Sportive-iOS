// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let centers = try? newJSONDecoder().decode(Centers.self, from: jsonData)

import Foundation

// MARK: - Center
struct Center: Codable {
    let id: Int
    let name, email, password, phone: String
    let type: TypeEnum
    let lang, lat: String
    let images: String
    let famous: Famous
    let datee, des, history: String
    let img1, img2: String
    let img3: Img3
    let img4: Img4
    let linkedIn: String?
    let facebook: String?
    let services: String?
    let website: String?

    enum CodingKeys: String, CodingKey {
        case id, name, email, password, phone, type, lang, lat, images, famous
        case datee = "Datee"
        case des, history
        case img1 = "img_1"
        case img2 = "img_2"
        case img3 = "img_3"
        case img4 = "img_4"
        case linkedIn = "linked_in"
        case facebook, services, website
    }
}

enum Famous: String, Codable {
    case empty = ""
    case famous = "famous"
}

enum Img3: String, Codable {
    case empty = ""
    case img3 = "img_3"
}

enum Img4: String, Codable {
    case empty = ""
    case img4 = "img_4"
}

enum TypeEnum: String, Codable {
    case center = "center"
}
