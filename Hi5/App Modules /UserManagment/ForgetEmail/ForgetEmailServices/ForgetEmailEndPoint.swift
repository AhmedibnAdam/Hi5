//
//  ForgetEmailEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/16/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum ForgetEmailEndpoint {
   case ForgetEmail(email: String)
}
//MARK:- extensions
extension ForgetEmailEndpoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .ForgetEmail:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .ForgetEmail:
            return "http://api-ksa.com/demo/hi5/public/api/player/" + "forget/password"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .ForgetEmail(let email):
            return ["email": email]
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .ForgetEmail:
            return ["Accept": "application/json"]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .ForgetEmail:
            return JSONEncoding.default
        }
    }
    
}
