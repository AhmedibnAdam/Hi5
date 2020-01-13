//
//  LoginModel.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct LoginModel {
     //MARK:- Request
	struct Request {
		// MARK : - do someting...
        
        func parameters(userName: String , password: String) -> [String: Any]? {
			// MARK : - do someting...
            return ["vie_id": userName , "password": password]
		}
       
   }
    //MARK:- Response
struct LoginResponse: Codable {
    let status: Bool?
    let token, userName, fullName: String?
    let phoneNumber: Int?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case status, token
        case userName = "user_name"
        case fullName = "full_name"
        case phoneNumber = "phone_number"
        case image
    }
  }
}
