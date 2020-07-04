//
//  ChangeUsernameEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/15/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum ChangeUsernameEndpoint {
   case ChangeUsername(username: String)
}
//MARK:- Extension
extension ChangeUsernameEndpoint: IEndpoint {
    var image: UIImage? {
        return nil
    }
    
    var method: HTTPMethod {
        switch self {
        case .ChangeUsername:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .ChangeUsername(let user):  //http://api-ksa.com/demo/hi5/public/api/player/ahmedadam/exists
            return "http://api-ksa.com/demo/hi5/public/api/player/" + user + "/exists"
        }
    }
    
    var parameter: Parameters? {
      return nil
    }
    
    var header: HTTPHeaders? {
//       switch self {
//           case .ChangeUsername:
//            let defaults = UserDefaults.standard
//            let token = defaults.string(forKey: "Token")
//            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
//        }
         return nil
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .ChangeUsername:
            return JSONEncoding.default
        }
    }
    
    
}
