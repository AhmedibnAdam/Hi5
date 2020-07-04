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
   case CreatePassword(parameters:[String: Any]?)
}

//MARK:- Extension
extension CreatePasswordEndpoint: IEndpoint {
    var image: UIImage? {
        return nil
    }
    
    
    var method: HTTPMethod {
        switch self {
        case .CreatePassword:
            return .post
        }
    }
    
    var path: String {
        switch self {
           case .CreatePassword:
             return "http://api-ksa.com/demo/hi5/public/api/player/" + "register"
        }
    }
    
    var parameter: Parameters? {
        switch self {
            case .CreatePassword(let param):
                return param
        }
    }
    
    var header: HTTPHeaders? {
     return nil
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .CreatePassword:
            return JSONEncoding.default
        }
    }
}
