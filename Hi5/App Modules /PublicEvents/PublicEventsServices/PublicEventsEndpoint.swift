//
//  PublicEventsEndpoint.swift
//  Hi5
//
//  Created by Adam on 3/17/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Alamofire

enum PublicEventsEndpoint {
    /*
     Add Endpoint
     case sample
     case sample(parameter: [String: Any])
     */
    case filterPublicEvent(parameter: [String: Any])
}

extension PublicEventsEndpoint: IEndpoint {
    
    var image: UIImage? {
        return nil
    }
    
    var method: HTTPMethod {
        
        
        switch self {
        case .filterPublicEvent:
            return .get
        }
        
    }
    
    var path: String {
        
        
        switch self {
        case .filterPublicEvent(let params):
            return "http://api-ksa.com/demo/hi5/public/api/player/public_events/filter?" + "&date=\(String(describing: params["date"]!))" +
                "&longitude=\(String(describing: params["longitude"]!))" +
            "&latitude=\(String(describing: params["latitude"]!))"
        }
        
    }
    
    var parameter: Parameters? {
        /*
         Do like this:
         
         switch self {
         case .sample(let model):
         return model.parameter()
         }
         */
        return nil
    }
    
    var header: HTTPHeaders? {
        
        
        switch self {
        case .filterPublicEvent(let parameter):
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            
            var headers = ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
            headers["date"] = "\( String(describing: parameter["date"]!))"
            headers["latitude"] = "\(String(describing: parameter["latitude"]!))"
            headers["latitude"] = "\(String(describing: parameter["latitude"]!))"
             return headers
        }
    }
    
    var encoding: ParameterEncoding {        
        /*
         Do like this:
         
         return URLEncoding.queryString for URL Query
         */
        switch self {
        case .filterPublicEvent:
            return JSONEncoding.default
        }
        
    }
}
