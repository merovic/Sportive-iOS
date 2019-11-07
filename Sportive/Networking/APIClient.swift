//
//  APIClient.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 14/12/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//
import Alamofire
import SwiftyJSON
class APIClient {
   @discardableResult
   private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T,AFError>)->Void) -> DataRequest {
       return AF.request(route)
                       .responseDecodable (decoder: decoder){
                           (response: DataResponse<T,AFError>) in
                           completion(response.result)
       }
   }
   @discardableResult
   private static func performRequestSimple(route:APIRouter, completion: @escaping (Result<String, AFError>)->Void) -> DataRequest {
       return AF.request(route)
           .responseString(encoding: String.Encoding.utf8) {
               (response) in
               completion(response.result)
       }
   }
    
    
    @discardableResult
    private static func performRequestSimplejson(route:APIRouter, completion: @escaping (Result<String, AFError>)->Void) -> DataRequest {
        return AF.request(route).responseJSON{
            response  in
        }
            .responseString(encoding: String.Encoding.utf8) {
                (response) in
                completion(response.result)
        }
    }
    //---------------------------------------------------
    
    static func loginCenterAndTrainer(email: String, password: String, completion:@escaping (Result<[LoginResponse],AFError>)->Void) {
      performRequest(route: APIRouter.login(email: email, password: password), completion: completion)
    }
    
    
   static func loginUser (email : String ,password:String , completion:@escaping (Result<String,AFError>)->Void) {
       performRequestSimple(route: .login( email: email, password: email), completion: completion)

    
   }
    
    
    
    
    
    
    
    static func Register (name : String ,email : String ,password:String,phone : String ,type : String ,long : String ,lat : String ,images : String ,famous: String ,desctiption : String,history : String,img_1 : String,img_2 : String,img_3 : String,img_4 : String , completion:@escaping (Result<String,AFError>)->Void) {
        performRequestSimple(route: .Register(name: name, email: email, password: email, phone: phone, type: type, long: long, lat: lat, images: images, famous: famous, desctiption: desctiption, history: history, img_1: img_1, img_2: img_2, img_3: img_3, img_4: img_4), completion: completion)

    }
    
    static func updateCenter (desctiption : String,history : String,img_1 : String,img_2 : String,img_3 : String,img_4 : String ,id : Int, completion:@escaping (Result<String,AFError>)->Void) {
        performRequestSimple(route: .Update_center(desctiption: desctiption, history: history, img_1: img_1, img_2: img_2, img_3: img_3, img_4: img_4, id: id), completion: completion)

    }
    
    static func AddGame (id_center : Int,name_game : String,coach : String, completion:@escaping (Result<String,AFError>)->Void) {
           performRequestSimple(route: .AddGame(id_center: id_center, name_game: name_game, coach: coach), completion: completion)


       }
    
    static func getAllCenters(completion:@escaping (Result<[Center],AFError>)->Void) {
           performRequest(route: APIRouter.Select_all_center, completion: completion)
           }
       
       
       static func getGames(id_center: Int, completion:@escaping (Result<[Game],AFError>)->Void) {
        performRequest(route: APIRouter.select_game(id_center: Centers.center!.id), completion: completion)
       }
       
       static func editCenterData(desctiption: String, history: String, img_1: String, img_2: String, img_3: String, img_4: String, id: Int, completion:@escaping (Result<String,AFError>)->Void) {
               performRequestSimple(route: APIRouter.Update_center(desctiption: desctiption, history: history, img_1: img_1, img_2: img_2, img_3: img_3, img_4: img_4, id: id), completion: completion)

       }

       static func editUserOrCenterData(name: String, password: String, phone: String, long: String, lat: String, images: String, desctiption: String, id: Int, completion:@escaping (Result<String,AFError>)->Void) {
           
           performRequestSimple(route: APIRouter.Update_user_or_center(name: name, password: password, phone: phone, long: long, lat: lat, images: images, desctiption: desctiption, id: id), completion: completion)

       }
    
    static func games(id_center: Int, completion:@escaping (Result<String,AFError>)->Void){
        performRequestSimple(route: APIRouter.select_game(id_center: id_center), completion: completion)
    }
    
    
    static func getAllActive(id : Int , completion:@escaping (Result<[AllActive],AFError>)->Void) {
       performRequest(route: APIRouter.Select_All_Activities(id: id), completion: completion)
       }
    
    
    static func getAllTariner(completion:@escaping (Result<[Tariner],AFError>)->Void) {
             performRequest(route: APIRouter.select_all_trainer, completion: completion)
             }
    
   static func getComments(id : Int , completion:@escaping (Result<[CommentElement],AFError>)->Void) {
   performRequest(route: APIRouter.Select_All_Activities(id: id), completion: completion)
   }
    
    
    
    
    
    
}


