//
//  PublicEventDetailsEndpoint.swift
//  Hi5
//
//  Created by Adam on 4/8/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Alamofire

enum PublicEventDetailsEndpoint {
    /*
     Add Endpoint
     case sample
     case sample(parameter: [String: Any])
    */
    case public_event(id: String)
      case leave_public_event(id: String)
}

extension PublicEventDetailsEndpoint: IEndpoint {
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
        return .get
    }
    
    var path: String {
  

        switch self {
              case .public_event(let id):
            return "http://api-ksa.com/demo/hi5/public/api/player/public_event/" + id
        case .leave_public_event(let id):
             return "http://api-ksa.com/demo/hi5/public/api/player/joined_public_event/" + id + "/leave"
        }
 
//        return "http://api-ksa.com/demo/hi5/public/api/player/public_event/"
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


//        switch self {
//        case .public_event(let id):
//            return ["id": id]
//        }
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
