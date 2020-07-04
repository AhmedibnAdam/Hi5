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
    case sendVerificationCode
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
        
    case .sendVerificationCode:
        return .post
        }
}
    var path: String {
    switch self {
       case .PhoneVerification(let code):
         return "http://api-ksa.com/demo/hi5/public/api/player/register/check_verification_code?code==\(code)"
       case .ResendVerificationCode:
         return "http://api-ksa.com/demo/hi5/public/api/player/" + "resend"
    case .sendVerificationCode:
        return "http://api-ksa.com/demo/hi5/public/api/player/send-verification-code"
        }
    }
    var parameter: Parameters? {
    switch self {
        case .PhoneVerification(let code):
            return ["code": code]
    case .ResendVerificationCode:
            return ["email": "fudex2003@gmail.com"]
    case .sendVerificationCode:
         return ["email": "fudex2003@gmail.com"]
        }
  }
    
    var header: HTTPHeaders? {

    switch self {
       case .PhoneVerification:
        
        let defaults = UserDefaults.standard
              let token = defaults.string(forKey: "Token")
              return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        
        
       case .ResendVerificationCode:
          return ["Accept": "application/json"]
    case .sendVerificationCode:
        return ["Accept": "application/json"]
        }
    }
    
    var encoding: ParameterEncoding {

        switch self {
         case .PhoneVerification:
            return URLEncoding.default
         case .ResendVerificationCode:
            return JSONEncoding.default
        case .sendVerificationCode:
        return JSONEncoding.default
        }
    }
}
