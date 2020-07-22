//
//  NewPasswordModel.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import UIKit

struct NewPasswordModel {	
	struct Request {
        func parameters(password: String , confirmPassword: String) -> [String: Any]? {
            return ["password": password , "password_confirmation": confirmPassword]
        }
	}

    struct NewPasswordResponse: Codable {
        let status: Bool?
        let success: String?
	}
}
