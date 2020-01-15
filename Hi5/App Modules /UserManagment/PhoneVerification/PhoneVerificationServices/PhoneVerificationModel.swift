//
//  PhoneVerificationModel.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct PhoneVerificationModel {	
	struct Request {
		// do someting...

		func parameters() -> [String: Any]? {
			// do someting...
			return nil
		}
	}

    struct PhoneVerificationResponse: Codable {
		
	}
    
    struct ResendVerificationCodeResponse: Codable {
        
    }
}
