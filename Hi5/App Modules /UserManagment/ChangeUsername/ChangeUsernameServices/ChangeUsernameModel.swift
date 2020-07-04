//
//  ChangeUsernameModel.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct ChangeUsernameModel {	
	struct Request {
        func parameters(username: String) -> [String: Any]? {
            return ["vie_id": username]
        }
	}

    struct ChangeUsernameResponse: Codable {
        let status: Bool?
        let msg: String?
    }
}
