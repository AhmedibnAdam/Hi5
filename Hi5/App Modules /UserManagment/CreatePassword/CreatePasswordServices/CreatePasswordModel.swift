//
//  CreatePasswordModel.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct CreatePasswordModel {	
	struct Request {
        func parameters(password: String , confirmPassword: String) -> [String: Any]? {
            return ["password": password , "password_confirmation": confirmPassword]
        }
	}
    struct CreatePasswordResponse: Codable {
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
