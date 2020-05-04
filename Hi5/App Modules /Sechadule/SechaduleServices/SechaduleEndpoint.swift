//
//  SechaduleEndpoint.swift
//  Hi5
//
//  Created by Adam on 3/24/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Alamofire

enum SechaduleEndpoint {
    case pastSechadule
    case upCommingSechadule
    case cancelSechadule
}

extension SechaduleEndpoint: IEndpoint {
    var image: UIImage? {
        return nil
    }
    
    var method: HTTPMethod {
        
        return .get
    }
    
    var path: String {
        switch self {
        case .pastSechadule:
            return "http://api-ksa.com/demo/hi5/public/api/player/my_schedule?status=past"
        case .upCommingSechadule:
            return "http://api-ksa.com/demo/hi5/public/api/player/my_schedule?status=upcoming"
        case .cancelSechadule:
            return "http://api-ksa.com/demo/hi5/public/api/player/my_schedule?status=canceled"
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
