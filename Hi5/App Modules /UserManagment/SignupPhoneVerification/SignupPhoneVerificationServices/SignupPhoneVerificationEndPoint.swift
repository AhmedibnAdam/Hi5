//
//  RegisterEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/13/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum SignupPhoneVerificationEndpoint {
    case signupPhoneVerification(code: String)
    case signupResendVerificationCode
}

extension SignupPhoneVerificationEndpoint: IEndpoint {
    var method: HTTPMethod {
        
    switch self {
      case .signupPhoneVerification:
        return .get
    case .signupResendVerificationCode:
        return .post
    }
}
    
    var path: String {

    switch self {
       case .signupPhoneVerification:
         return "http://api-ksa.com/demo/hi5/public/api/player/register" + "check_verification_code"
       case .signupResendVerificationCode:
         return "http://api-ksa.com/demo/hi5/public/api/player/" + "resend"
       }
    }
    
    var parameter: Parameters? {

    switch self {
        case .signupPhoneVerification(let code):
            return ["code": code]
    case .signupResendVerificationCode:
            return ["email": ""]
        }
  }
    
    var header: HTTPHeaders? {

    switch self {
       case .signupPhoneVerification:
           return ["Accept": "application/json"]
       case .signupResendVerificationCode:
          return ["Accept": "application/json"]
       }
    }
    
    var encoding: ParameterEncoding {

        switch self {
         case .signupPhoneVerification:
            return URLEncoding.default
         case .signupResendVerificationCode:
            return JSONEncoding.default
        }
    }
}

