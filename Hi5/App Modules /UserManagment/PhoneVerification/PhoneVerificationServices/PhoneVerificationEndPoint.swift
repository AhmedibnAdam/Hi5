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
    case phone(phone: String)
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
    case .phone:
        return .post
        }
}
    var path: String {
    switch self {
       case .PhoneVerification(let code):
         return Constant.base + "player/register/check_verification_code?code==\(code)"
       case .ResendVerificationCode:
         return Constant.base + "player/" + "resend"
    case .sendVerificationCode:
        return Constant.base + "player/send-verification-code"
    case .phone:
        return Constant.base + "player/phone_number/create"
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
    case .phone(let phone ):
        return ["phone_number": phone]
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
    case .phone:
          let defaults = UserDefaults.standard
                    let token = defaults.string(forKey: "Token")
                    return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        }
    }
    
    var encoding: ParameterEncoding {

         return URLEncoding.default
    }
}
