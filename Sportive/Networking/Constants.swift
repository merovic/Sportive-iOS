//
//  Constants.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 26/11/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import Foundation

struct K {
    struct ProductionServer {

        static let baseURL = "http://sportive.technowow.net/sportive.asmx"
    }
    
    struct Forget_password_by_email {
        static let email = "email"
    }
    
    struct AddActivities {
        static let id_send = "id_send"
        static let id_recived = "id_recived"
        static let message = "message"
        static let type = "type"
    }
    
    struct AddGame {
        static let id_center = "id_center"
        static let name_game = "name_game"
        static let coach = "coach"
        
    }
    struct Join {
        static let id_center = "id_center"
        static let game_name = "game_name"
        static let id_user = "id_user"
    }
    struct Login {
           static let email = "email"
           static let password = "pass"
       }
    struct Register {
        
        static let name = "name"
        static let email = "email"
        static let password = "password"
        static let phone = "phone"
        static let type = "type"
        static let long = "lang"
        static let lat = "lat"
        static let images = "images"
        static let famous = "famous"
        static let desctiption = "des"
        static let history = "history"
        static let img_1 = "img_1"
        static let img_2 = "img_2"
        static let img_3 = "img_3"
        static let img_4 = "img_4"
    }
    
    struct Select_All_Activities {
        static let id = "id"
    }
    struct SearchAllCenteres {
        static let text = "text"
    }
    struct Select_game {
        static let id_center = "id_center"
    }
    struct Join_Center {
        static let id_center = "id_center"
    }
    struct Select_join_iduser {
        static let id_user = "id_user"
    }
    struct Update_center {
        static let desctiption = "des"
        static let history = "history"
        static let img_1 = "img_1"
        static let img_2 = "img_2"
        static let img_3 = "img_3"
        static let img_4 = "img_4"
        static let id = "id"
    }
    struct Update_user_or_center {
        
        static let name = "name"
        static let password = "password"
        static let phone = "phone"
        static let long = "lang"
        static let lat = "lat"
        static let images = "images"
        static let desctiption = "des"
        static let id = "id"

    }
    
}



enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/x-www-form-urlencoded"
}
