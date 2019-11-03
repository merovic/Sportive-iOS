
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
