//
//  APIRouter.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 26/11/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case login(email:String, password:String)
    case user_details
    case registration(name:String, email:String, password:String, confirm:String,mobile_token:String)
    case logout
    case publish_order(order_description:String,image:String,distance:String,duration:String,promo_code:String,delivery_time:String,order_from_location:String,order_to_location:String,client_location_lat:String,client_location_long:String,order_location_lat:String,order_location_long:String)
    
    case getOffers
    case acceptOffer(offerID:String)
    case rejectOffer(offerID:String)
    case submitOffer(starID:String,orderID:String,expected_delivery_time:String,offer_value:String)
    
    case getOrders
    case getNotifications
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .user_details:
            return .get
        case .registration:
            return .post
        case .logout:
            return .get
        case .publish_order:
            return .post
        case .getOffers:
            return .get
        case .acceptOffer:
            return .post
        case .rejectOffer:
            return .post
        case .getOrders:
            return .get
        case .submitOffer:
            return .post
        case .getNotifications:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .user_details:
            return "/user-details"
        case .registration:
            return "/auth/register"
        case .logout:
            return "/logout"
        case .publish_order:
            return "/store-order"
        case .getOffers:
            return "/order-offers/" + UserDefault.getorderID()
            //return "/order-offers/35"
        case .acceptOffer:
            return "/accept-offer"
        case .rejectOffer:
            return "/reject-offer"
        case .getOrders:
            return "/show-orders"
        case .submitOffer:
            return "/submit-offer"
        case .getNotifications:
            return "/my-notifications"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .login(let email, let password):
            return [K.Login.email: email, K.Login.password: password]
        case .user_details:
            return nil
        case .registration(let name, let email, let password, let confirm,let mobile_token):
            return [K.Registration.name: name, K.Registration.email: email, K.Registration.password: password, K.Registration.password_confirmation: confirm,
                K.Registration.mobile_token: mobile_token]
        case .logout:
            return nil
        
        case .publish_order(let order_description, let image, let distance, let duration, let promo_code, let delivery_time, let order_from_location, let order_to_location, let client_location_lat, let client_location_long, let order_location_lat, let order_location_long):
            return [K.PublishOrder.order_description: order_description,K.PublishOrder.image: image,K.PublishOrder.distance: distance,K.PublishOrder.duration: duration,K.PublishOrder.promo_code: promo_code,K.PublishOrder.delivery_time: delivery_time,K.PublishOrder.order_from_location: order_from_location,K.PublishOrder.order_to_location: order_to_location,K.PublishOrder.client_location_lat: client_location_lat,K.PublishOrder.client_location_long: client_location_long, K.PublishOrder.order_location_lat: order_location_lat, K.PublishOrder.order_location_long: order_location_long]
        case .getOffers:
            return nil
        case .acceptOffer(let offerID):
            return[K.AcceptRejectOffer.offer_id: offerID]
        case .rejectOffer(let offerID):
            return[K.AcceptRejectOffer.offer_id: offerID]
        case .getOrders:
            return nil
        case .submitOffer(let starID, let orderID, let expected_delivery_time, let offer_value):
            return [K.SubmitOffer.star_id: starID,K.SubmitOffer.order_id: orderID,K.SubmitOffer.expected_delivery_time: expected_delivery_time,K.SubmitOffer.offer_value: offer_value]
        case .getNotifications:
            return nil
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
    
    urlRequest.setValue("Bearer " + UserDefault.getToken(), forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
    
    
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

