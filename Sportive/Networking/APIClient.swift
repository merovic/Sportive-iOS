//
//  APIClient.swift/Users/apple/Documents/Xcode/HatleyOriginal/HatleyOriginal/Network/Constants.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 14/12/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import Alamofire

class APIClient {
    
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T,Error>)->Void) -> DataRequest {
        return AF.request(route)
                        .responseDecodable (decoder: decoder){
                            
                            (response: DataResponse<T>) in
                            
                            completion(response.result)
        }
    }
    
    @discardableResult
    private static func performRequestNew<T:Decodable>(route:APIRouterNew, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T,Error>)->Void) -> DataRequest {
        return AF.request(route)
                        .responseDecodable (decoder: decoder){
                            
                            (response: DataResponse<T>) in
                            
                            completion(response.result)
        }
    }
    
    
    
    @discardableResult
    private static func performRequestSimple(route:APIRouter, completion: @escaping (Result<String, Error>)->Void) -> DataRequest {
        return AF.request(route)
            .responseString(encoding: String.Encoding.utf8) {
                
                (response) in
                
                completion(response.result)
                
        }
    }
    
    @discardableResult
    private static func performRequestSimpleNew(route:APIRouterNew, completion: @escaping (Result<String, Error>)->Void) -> DataRequest {
        return AF.request(route)
            .responseString(encoding: String.Encoding.utf8) {
                
                (response) in
                
                completion(response.result)
                
        }
    }
    
    
    //----------------------------------------------------
    
    static func login(email: String, password: String, completion:@escaping (Result<LoginResponse,Error>)->Void) {
        
        performRequest(route: APIRouter.login(email: email, password: password), completion: completion)
        
    }
    
    static func user_details(completion:@escaping (Result<GetUserResponse,Error>)->Void) {
        
        performRequest(route: APIRouter.user_details, completion: completion)
        
    }
    
    static func registration(name: String, email: String, password: String, confirm: String, mobile_token: String, completion:@escaping (Result<LoginResponse,Error>)->Void) {
        
        performRequest(route: APIRouter.registration(name: name, email: email, password: password, confirm: confirm, mobile_token: mobile_token), completion: completion)
        
    }
    
    static func logout(completion:@escaping (Result<Logout,Error>)->Void) {
        
        performRequest(route: APIRouter.logout, completion: completion)
        
    }
    
    static func getOffers(completion:@escaping (Result<OffersResponse,Error>)->Void) {
        
        performRequest(route: APIRouter.getOffers, completion: completion)
        
    }
    
    static func publish_order(order_description:String,image:String,distance:String,duration:String,promo_code:String,delivery_time:String,order_from_location:String,order_to_location:String,client_location_lat:String,client_location_long:String,order_location_lat:String,order_location_long:String, completion:@escaping (Result<OrderResponse,Error>)->Void) {
           
        performRequest(route: APIRouter.publish_order(order_description: order_description, image: image, distance: distance, duration: duration, promo_code: promo_code, delivery_time: delivery_time, order_from_location: order_from_location, order_to_location: order_to_location, client_location_lat: client_location_lat, client_location_long: client_location_long, order_location_lat: order_location_lat, order_location_long: order_location_long), completion: completion)
           
       }
    
    
    static func acceptOffer(offerID:String, completion:@escaping (Result<String,Error>)->Void) {
        
        performRequestSimple(route: APIRouter.acceptOffer(offerID: offerID), completion: completion)
        
    }
    
    static func rejectOffer(offerID:String, completion:@escaping (Result<AcceptOffersResponse,Error>)->Void) {
        
        performRequest(route: APIRouter.rejectOffer(offerID: offerID), completion: completion)
        
    }
    
    
    static func getOrders(completion:@escaping (Result<GetOrdersResponse,Error>)->Void) {
        
        performRequest(route: APIRouter.getOrders, completion: completion)
        
    }
    
    static func submitOffer(starID:String, orderID:String, expected_delivery_time:String, offer_value:String, completion:@escaping (Result<String,Error>)->Void) {
        
        performRequestSimple(route: APIRouter.submitOffer(starID: starID, orderID: orderID, expected_delivery_time: expected_delivery_time, offer_value: offer_value), completion: completion)
        
    }
    
    static func getNotifications(completion:@escaping (Result<NotificationsResponse,Error>)->Void) {
        
        performRequest(route: APIRouter.getNotifications, completion: completion)
        
    }

}
