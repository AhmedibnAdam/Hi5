//
//  CheckOutSessionDetailsModel.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct CheckOutSessionDetailsModel {
    struct Request {
        // do someting...

        func parameters() -> [String: Any]? {
            // do someting...
            return nil
        }
    }

    // MARK: - PublicEventDetailsJoin
    struct PublicEventDetailsJoin: Codable {
        let status: Bool
        let joined: Joined
    }

    // MARK: - Joined
    struct Joined: Codable {
        let id: Int
        let payment, status: String
    }

}
