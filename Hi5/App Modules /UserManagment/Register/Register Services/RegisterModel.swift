//
//  RegisterModel.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct RegisterModel {	
	struct Request {
		// MARK : - do someting...
        func parameters(fullName: String , phoneNumber: String) -> [String: Any]? {
            // MARK : - do someting...
            return ["full_name": fullName , "phone_number": phoneNumber]
        }
	}
    struct SignupResponse: Codable {
        let status: Bool?
        let userName, fullName, token: String?

        enum CodingKeys: String, CodingKey {
            case status
            case userName = "user_name"
            case fullName = "full_name"
            case token
        }
    }
}
