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
}

extension SignupPhoneVerificationEndpoint: IEndpoint {
    var method: HTTPMethod {
        
    switch self {
      case .signupPhoneVerification:
        return .get
    }
}
    
    var path: String {

    switch self {
       case .signupPhoneVerification:
         return "http://api-ksa.com/demo/hi5/public/api/player/" + "register"
       }
    }
    
    var parameter: Parameters? {

    switch self {
        case .signupPhoneVerification(let code):
            return ["code": code]
        }
  }
    
    var header: HTTPHeaders? {

    switch self {
       case .signupPhoneVerification:
           return ["Accept": "application/json"]
       }
    }
    
    var encoding: ParameterEncoding {

        switch self {
        case .signupPhoneVerification:
            return URLEncoding.default
        }
    }
}

