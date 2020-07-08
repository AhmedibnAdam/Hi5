//
//  NewPasswordEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/15/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum NewPasswordEndpoint {
    case NewPassword(parameters: [String: Any])
}
//MARK:- extension
extension NewPasswordEndpoint: IEndpoint {
    var image: UIImage? {
        return nil
    }
    
    var method: HTTPMethod {
        switch self {
        case .NewPassword:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .NewPassword:
            return "http://api-ksa.com/demo/hi5/public/api/player/" + "player_reset_password"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .NewPassword(let parameters):
            return parameters
        }
    }
    
    var header: HTTPHeaders? {
          switch self {
          case .NewPassword:
            return ["Accept": "application/json"]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .NewPassword:
            return JSONEncoding.default
        }
    }
}
