//
//  PhoneVerificationModel.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


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
        let status: Bool?
           let  msg: String?

           enum CodingKeys: String, CodingKey {
               case status
           
               case  msg
           }
	}
    
    struct ResendVerificationCodeResponse: Codable {
        
    }
}
