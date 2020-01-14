//
//  CreatePasswordWndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/14/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum CreatePasswordEndpoint {
   case CreatePassword(password: String , confirmPassword: String)
}

//MARK:- Extension
extension CreatePasswordEndpoint: IEndpoint {
    
    var method: HTTPMethod {
        switch self {
        case .CreatePassword:
            return .post
        }
    }
    
    var path: String {
        switch self {
           case .CreatePassword:
             return "http://api-ksa.com/demo/hi5/public/api/player/" + "create_password"
        }
    }
    
    var parameter: Parameters? {
        switch self {
            case .CreatePassword(let password , let confirmPassword):
                return ["password": password , "password_confirmation": confirmPassword]
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
           case .CreatePassword:
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .CreatePassword:
            return JSONEncoding.default
        }
    }
}
