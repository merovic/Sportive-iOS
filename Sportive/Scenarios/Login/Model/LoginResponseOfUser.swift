// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let loginResponseOfUser = try? newJSONDecoder().decode(LoginResponseOfUser.self, from: jsonData)

import Foundation

// MARK: - LoginResponseOfUserElement
struct LoginResponseOfUser: Codable {
    let id: Int
    let name, email, password, phone: String
    let type, lang, lat, images: String
    let famous, datee, des, history: String
    let img1, img2, img3, img4: String
    let linkedIn: String
    let facebook, services, website: JSONNull?

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

//typealias LoginResponseOfUser = [LoginResponseOfUserElement]

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

