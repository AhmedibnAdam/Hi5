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
        func parameters(code: String) -> [String: Any]? {
            return ["code": code]
        }
	}

    struct SignupPhoneVerificationResponse: Codable {
        let status: Bool?
        let error: String?
	}
}
