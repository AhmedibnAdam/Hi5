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
	struct Request {
		// MARK : - do someting...
		func parameters() -> [String: Any]? {
			// MARK : - do someting...
            return ["username":"01126223344" , "password":"123456"]
		}
	}

    struct Response: Codable {
		// MARK : - do someting...
        let vvvcode: Int
        let vvvmessage: String
       
	}
}
