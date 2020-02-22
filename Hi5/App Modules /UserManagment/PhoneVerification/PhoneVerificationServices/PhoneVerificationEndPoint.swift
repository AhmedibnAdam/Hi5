//
//  PhoneVerificationEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/15/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum PhoneVerificationEndpoint {
    case PhoneVerification(code: String)
    case ResendVerificationCode
}

extension PhoneVerificationEndpoint: IEndpoint {
    var image: UIImage? {
        return nil
    }
    
    var method: HTTPMethod {
        
    switch self {
      case .PhoneVerification:
        return .get
    case .ResendVerificationCode:
        return .post
    }
}
    
    var path: String {

    switch self {
       case .PhoneVerification:
         return "http://api-ksa.com/demo/hi5/public/api/player/" + "register"
       case .ResendVerificationCode:
         return "http://api-ksa.com/demo/hi5/public/api/player/" + "resend"
       }
    }
    
    var parameter: Parameters? {

    switch self {
        case .PhoneVerification(let code):
            return ["code": code]
    case .ResendVerificationCode:
            return ["email": ""]
        }
  }
    
    var header: HTTPHeaders? {

    switch self {
       case .PhoneVerification:
           return ["Accept": "application/json"]
       case .ResendVerificationCode:
          return ["Accept": "application/json"]
       }
    }
    
    var encoding: ParameterEncoding {

        switch self {
         case .PhoneVerification:
            return URLEncoding.default
         case .ResendVerificationCode:
            return JSONEncoding.default
        }
    }
}
