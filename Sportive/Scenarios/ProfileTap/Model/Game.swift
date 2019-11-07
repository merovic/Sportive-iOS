// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let games = try? newJSONDecoder().decode(Games.self, from: jsonData)

import Foundation

// MARK: - Game
struct Game: Codable {
    let id, idCenter: Int
    let nameGame, coach, datee: String

    enum CodingKeys: String, CodingKey {
        case id
        case idCenter = "id_center"
        case nameGame = "name_game"
        case coach
        case datee = "Datee"
    }
}

typealias Games = [Game]
