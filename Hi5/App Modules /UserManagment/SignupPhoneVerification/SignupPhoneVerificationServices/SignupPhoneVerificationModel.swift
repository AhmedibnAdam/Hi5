//
//  SignupPhoneVerificationModel.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct SignupPhoneVerificationModel {	
	struct Request {
        func parameters(email: String) -> [String: Any]? {
            return ["email": email]
        }
	}

    struct SignupPhoneVerificationResponse: Codable {
        let status: Bool?
        let error: String?
	}
    
    struct SignupResendVerificationCodeResponse: Codable {
         
    }
}
