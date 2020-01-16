//
//  ForgetEmailModel.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct ForgetEmailModel {	
	struct Request {
        func parameters(email: String) -> [String: Any]? {
            return ["email": email]
        }
	}

    struct ForgetEmailResponse: Codable {
        
	}
}
