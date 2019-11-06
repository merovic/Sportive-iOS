// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let comment = try? newJSONDecoder().decode(Comment.self, from: jsonData)

import Foundation

// MARK: - CommentElement
struct CommentElement: Codable {
    let id, idUser, idCenter: Int
    let comment, rate, datee: String
    let id1: Int
    let name, email, password, phone: String
    let type, lang, lat: String
    let images: String
    let famous, datee1, des, history: String
    let img1, img2, img3, img4: String
    let linkedIn, facebook, services, website: JSONNul?

    enum CodingKeys: String, CodingKey {
        case id
        case idUser = "id_user"
        case idCenter = "id_center"
        case comment = "Comment"
        case rate = "Rate"
        case datee = "Datee"
        case id1, name, email, password, phone, type, lang, lat, images, famous
        case datee1 = "Datee1"
        case des, history
        case img1 = "img_1"
        case img2 = "img_2"
        case img3 = "img_3"
        case img4 = "img_4"
        case linkedIn = "linked_in"
        case facebook, services, website
    }
}

// MARK: - Encode/decode helpers

class JSONNul: Codable, Hashable {

    public static func == (lhs: JSONNul, rhs: JSONNul) -> Bool {
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
