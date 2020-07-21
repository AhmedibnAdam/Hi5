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
    case searchPublicEvent(parameter: [String: Any])
}

extension PublicEventsEndpoint: IEndpoint {
    
    var image: UIImage? {
        return nil
    }
    
    var method: HTTPMethod {
        
        
        switch self {
        case .filterPublicEvent:
            return .get
        case .searchPublicEvent:
            return .post
        }
        
    }
    
    var path: String {
        
        
        switch self {
        case .filterPublicEvent(let params):
            return Constant.base + "player/public_events/filter?" + "&date=\(String(describing: params["date"]!))" +
                "&longitude=\(String(describing: params["longitude"]!))" +
            "&latitude=\(String(describing: params["latitude"]!))"
        case .searchPublicEvent(let parameter):
            return Constant.base + "player/public_events/search"
        }
        
    }
    
    var parameter: Parameters? {
         switch self {
              case .filterPublicEvent:
                  return nil
              case .searchPublicEvent(let param):
                  return param
              }
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
        case .searchPublicEvent:
              let defaults = UserDefaults.standard
                      let token = defaults.string(forKey: "Token")
                      
              let headers = ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
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
        case .searchPublicEvent:
             return JSONEncoding.default

        }
        
    }
}
