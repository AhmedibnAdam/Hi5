//
//  NewPasswordModel.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct NewPasswordModel {	
	struct Request {
        func parameters(password: String , confirmPassword: String) -> [String: Any]? {
            return ["password": password , "password_confirmation": confirmPassword]
        }
	}

    struct NewPasswordResponse: Codable {
		
	}
}
