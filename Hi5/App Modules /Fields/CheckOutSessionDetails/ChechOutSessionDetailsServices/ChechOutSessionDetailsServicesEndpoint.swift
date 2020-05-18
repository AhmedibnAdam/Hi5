//
//  CheckOutSessionDetailsEndpoint.swift
//  Hi5
//
//  Created by Adam on 4/14/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Alamofire

enum CheckOutSessionDetailsEndpoint {
    
    case join(event_id: String)
    case book(event_id: String, parameter: [String: Any])
//     case sample(parameter: [String: Any])
   
}

extension CheckOutSessionDetailsEndpoint: IEndpoint {
    var image: UIImage? {
        return nil
    }
    
    var method: HTTPMethod {
        /*
        Do like this:

        switch self {
        case .sample:
            return .get
        }
        */
       switch self {
               case .join:
                   return .post
       case .book:
           return .post
        }
    }
    
    var path: String {
  
        switch self {
        case .join(let id ):
            return "http://api-ksa.com/demo/hi5/public/api/player/public_event/" + id + "/join"
        case .book(let id , _):
            return "http://api-ksa.com/demo/hi5/public/api/player/session/" + id + "/book"
        }
  
    }
    
    var parameter: Parameters? {
   

        switch self {
        case .book( _ , let parameter):
            return parameter
        case .join:
            return nil
        }
        
      
    }
    
    var header: HTTPHeaders? {
        /*
        Do like this:

        switch self {
        case .sample:
            return ["key": Any]
        }
        */
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
                        return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        
    }
    
    var encoding: ParameterEncoding {
        /*
        Do like this:
        
        return URLEncoding.queryString for URL Query
        
        switch self {
        case .sample:
            return JSONEncoding.default
        }
        */
           return JSONEncoding.default
    }
}
