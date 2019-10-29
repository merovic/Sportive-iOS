//
//  APIRouter.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 26/11/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case Forget_password_by_email(email:String)
    case AddActivities(id_send:Int ,id_recived:Int , message:String , type:String )
    case AddGame ( id_center : Int,name_game : String ,coach : String)
    case Join (id_center : Int,game_name : String ,id_user : Int )
    case login(email:String, password:String)
    case Register( name : String ,email : String ,password:String,phone : String ,type : String ,long : String ,lat : String ,images : String ,famous: String ,desctiption : String,history : String,img_1 : String,img_2 : String,img_3 : String,img_4 : String)
    case Select_All_Activities(id : Int)
    case Select_all_center
    case select_all_center_famous
    case SearchAllCenteres(text : String)
    case Select_game (id_center : Int)
    case Join_Center (id_center : Int)
    case Select_join_iduser (id_user : Int)
    case Update_center (desctiption : String ,history : String ,
    String,img_1 : String,img_2 : String,img_3 : String,img_4 : String ,id : Int)
    case Update_user_or_center ( name : String  ,password:String,phone : String  ,long : String ,lat : String ,images : String , desctiption : String , id : Int )
    
    

    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        
        case .Forget_password_by_email:
             return .get
        case .AddActivities:
             return .get
        case .AddGame:
             return .get
        case .Join:
             return .get
        case .login:
            return .get
        case .Register:
             return .get
        case .Select_All_Activities:
             return .get
        case .Select_all_center:
                 return .get
        case .select_all_center_famous:
                 return .get
        case .SearchAllCenteres:
             return .get
        case .Select_game:
             return .get
        case .Join_Center:
             return .get
        case .Select_join_iduser:
         return .get
        case .Update_center:
             return .get
        case .Update_user_or_center:
             return .get
        
        }
    }

    // MARK: - Path
    private var path: String {
        switch self {
       
        case .Forget_password_by_email:
             return "/forgete_password_by_email"
        case .AddActivities:
             return "/insert_activites"
        case .AddGame:
             return "/insert_game"
        case .Join:
             return "/insert_join"
        case .login:
             return "/login_user"
        case .Register:
             return "/register"
        case .Select_All_Activities:
             return "/select_all_active"
        case .Select_all_center:
             return "/select_all_center"
        case .select_all_center_famous:
             return "/select_all_center_famous"
        case .SearchAllCenteres:
            return "/select_all_center_search"
        case .Select_game:
             return "/select_game"
        case .Join_Center:
             return "/select_join_center"
        case .Select_join_iduser:
         return "/select_join_iduser"
        case .Update_center:
             return "/update_center"
        case .Update_user_or_center:
             return "/update_user_or_center"
        
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .login(let email, let password):
            return [K.Login.email: email, K.Login.password: password]
        
        case .Forget_password_by_email(let email):
            return [K.Forget_password_by_email.email : email]
        case .AddActivities(let id_send, let id_recived, let message, let type):
            return [K.AddActivities.id_send : id_send , K.AddActivities.id_recived : id_recived , K.AddActivities.message : message , K.AddActivities.type : type]
        case .AddGame(let id_center, let name_game, let coach):
            return [K.AddGame.id_center: id_center , K.AddGame.name_game: name_game,K.AddGame.coach: coach ]
        case .Join(let id_center, let game_name, let id_user):
            return [K.Join.id_center : id_center , K.Join.game_name : game_name, K.Join.id_user  : id_user ]
        case .Register(let name, let email, let password, let phone, let type, let long, let lat, let images, let famous, let desctiption, let history, let img_1, let img_2, let img_3, let img_4):
            return [K.Register.name : name , K.Register.email : email , K.Register.password : password , K.Register.phone : phone , K.Register.type : type , K.Register.long : long , K.Register.lat : lat , K.Register.images : images , K.Register.famous : famous , K.Register.desctiption : desctiption , K.Register.history : history ,K.Register.img_1: img_1,K.Register.img_2: img_2,K.Register.img_3: img_3,K.Register.img_4: img_4]
        case .Select_All_Activities(let id):
            return [K.Select_All_Activities.id : id]
        case .Select_all_center:
            return nil
        case .select_all_center_famous:
            return nil
        case .SearchAllCenteres(let text):
            return [K.SearchAllCenteres.text : text]
        case .Select_game(let id_center):
            return [K.Select_game.id_center : id_center]
        case .Join_Center(let id_center):
            return [K.Join_Center.id_center : id_center]
        case .Select_join_iduser(let id_user):
            return [K.Select_join_iduser.id_user : id_user]
        case .Update_center(let desctiption, let history, _, let img_1, let img_2, let img_3, let img_4, let id):
            return [K.Update_center.desctiption : desctiption , K.Update_center.history : history , K.Update_center.img_1 : img_1,K.Update_center.img_2 : img_2,K.Update_center.img_3 : img_3,K.Update_center.img_4 : img_4,K.Update_center.id : id]
        case .Update_user_or_center(let name, let password, let phone, let long, let lat, let images, let desctiption, let id):
            return [K.Update_user_or_center.name : name , K.Update_user_or_center.password : password , K.Update_user_or_center.phone : phone , K.Update_user_or_center.long: long , K.Update_user_or_center.lat :  lat,K.Update_user_or_center.images: images , K.Update_user_or_center.desctiption: desctiption , K.Update_user_or_center.id: id]
        }
}
    
// MARK: - URLRequestConvertible
func asURLRequest() throws -> URLRequest {
    
    let url = try K.ProductionServer.baseURL.asURL()
    
    var urlRequest = URLRequest(url: url.appendingPathComponent(path))
    
    // HTTP Method
    urlRequest.httpMethod = method.rawValue
    
    // Common Headers
    urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
    urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
    
    
    
    // Parameters
    var encodedURLRequest:URLRequest? = nil
    
    var Vparameters: [String: Any]
    
    if(parameters == nil)
    {
        encodedURLRequest = try URLEncoding.queryString.encode(urlRequest, with: nil)
    }else
    {
        Vparameters = parameters!
        encodedURLRequest = try URLEncoding.queryString.encode(urlRequest, with: Vparameters)
    }

    
    return encodedURLRequest!
    
    }
}

