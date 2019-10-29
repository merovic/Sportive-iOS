// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let loginResponse = try? newJSONDecoder().decode(LoginResponse.self, from: jsonData)

import Foundation

// MARK: - LoginResponseElement
struct LoginResponse: Codable {
    let id: Int
    let name, email, password, phone: String
    let type, lang, lat, images: String
    let famous, datee, des, history: String
    let img1, img2, img3, img4: String
    let linkedIn, facebook, services, website: String

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
//
//typealias LoginResponse = [LoginResponseElement]
