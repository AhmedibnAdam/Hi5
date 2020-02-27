//
//  RegisterEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/13/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum RegisterEndpoint {
    /*
     Add Endpoint
     case sample
     case sample(parameter: [String: Any])
    */
    case signup(fullName: String , phoneNumber: String)
}

extension RegisterEndpoint: IEndpoint {
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
      case .signup:
        return .post
    }
}
    
    var path: String {
        /*
        Do like this:

        switch self {
        case .sample:
            return "https://httpbin.org/get"
        }
        */
    switch self {
       case .signup:
         return "http://api-ksa.com/demo/hi5/public/api/player/" + "register"
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
        
    switch self {
        case .signup(let fullName , let phoneNumber):
            return ["full_name": fullName , "phone_number": phoneNumber]
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
    switch self {
       case .signup:
           return ["Accept": "application/json"]
       }
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
        switch self {
        case .signup:
            return JSONEncoding.default
        }
    }
}

//struct RegisterModel {
//    let parameter = Parameters()
//}
