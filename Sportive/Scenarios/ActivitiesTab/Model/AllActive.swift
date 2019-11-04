import Foundation

// MARK: - AllActive
struct AllActive: Codable {
    let id, idSend, idReceive: Int
    let message, type, datee: String
    let id1: Int
    let name, email, password, phone: String
    let type1, lang, lat, images: String
    let famous, datee1, des, history: String
    let img1, img2, img3, img4: String
    let linkedIn, facebook, services, website: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id
        case idSend = "id_send"
        case idReceive = "id_receive"
        case message, type
        case datee = "Datee"
        case id1, name, email, password, phone, type1, lang, lat, images, famous
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

typealias AllActives = [AllActive]

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


