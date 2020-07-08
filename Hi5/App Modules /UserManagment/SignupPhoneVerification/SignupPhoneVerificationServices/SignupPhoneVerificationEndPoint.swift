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
    case forgetPassword(number: String)
    case signupPhoneVerification(phone: String , code: String)
    case signupResendVerificationCode
    case sendCodeAndPhone(phone: String , code: String)
}

extension SignupPhoneVerificationEndpoint: IEndpoint {
    var image: UIImage? {
        return nil
    }
    
    var method: HTTPMethod {
        
    switch self {
      case .signupPhoneVerification:
        return .get
    case .signupResendVerificationCode:
        return .post
    case .forgetPassword:
        return .get
    case .sendCodeAndPhone:
        return .get
        }
}
    
    var path: String {

    switch self {
       case .signupPhoneVerification:
         return "http://api-ksa.com/demo/hi5/public/api/player/check_verification_code"
       case .signupResendVerificationCode:
         return "http://api-ksa.com/demo/hi5/public/api/player/" + "resend"
    case .forgetPassword(number: let number):
         return "http://api-ksa.com/demo/hi5/public/api/player/forget/password?phone_number=\(number)"
    case .sendCodeAndPhone(let phone , let code):
        return "http://api-ksa.com/demo/hi5/public/api/player/check_verification_code?code=\(code)&phone_number=\(phone)"
        }
    }
    
    var parameter: Parameters? {

    switch self {
        case .signupPhoneVerification(let code):
            return ["code": code]
    case .signupResendVerificationCode:
            return ["email": ""]
    case .forgetPassword:
        return nil
    case .sendCodeAndPhone:
        return nil
        }
  }
    
    var header: HTTPHeaders? {

        switch self {
            case .signupPhoneVerification(let phone, let code):
             return ["Accept": "application/json"]
              //  return ["Accept": "application/json","phone_number": phone , "code": code]
        case .signupResendVerificationCode:
                 return ["Accept": "application/json"]
        case .forgetPassword:
              return ["Accept": "application/json"]
        case .sendCodeAndPhone:
            return ["Accept": "application/json"]
        }
           
    }
    
    var encoding: ParameterEncoding {
        switch self {
            case .signupPhoneVerification:
                return JSONEncoding.default
        case .signupResendVerificationCode:
               return JSONEncoding.default
        case .forgetPassword:
            return JSONEncoding.default
            
        case .sendCodeAndPhone:
               return JSONEncoding.default
        }
       
    }
}

