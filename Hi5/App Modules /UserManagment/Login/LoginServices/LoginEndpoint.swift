//
//  LoginEndpoint.swift
//  Hi5
//
//  Created by Adam on 12/26/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Alamofire

enum LoginEndpoint {
    /*
     Add Endpoint
     case sample
     case sample(parameter: [String: Any])
    */
    case login(userName: String , password: String)
}

extension LoginEndpoint: IEndpoint {
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
      case .login:
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
       // http://api-ksa.com/demo/hi5/public/api/player/login?
    switch self {
       case .login:
         //return "https://www.soqiaa-app.com/app/api/" + "userLogin"
           return "http://api-ksa.com/demo/hi5/public/api/player/" + "login"
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
        
        case .login(let userName , let password):
            let defaults = UserDefaults.standard
            let device_token = defaults.string(forKey: "firebase_token")
            return ["vie_id": userName , "password": password , "device_token": device_token!]
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
       case .login:
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
        case .login:
            return JSONEncoding.default
        }
    }
}

//struct model {
//    let parameter = Parameters()
//}
