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
    
    // MARK: - CheckOut
    struct CheckOut: Codable {
        let status: Bool?
        let session: Session?
    }

    // MARK: - Session
    struct Session: Codable {
        let id: Int?
        let partnerName, fieldName, date, time: String?
        let freeCancellationTime, feesForCancellation: Int?
        let discount: String?
        let price: Int?
        let booked: Booked?

        enum CodingKeys: String, CodingKey {
            case id
            case partnerName = "partner_name"
            case fieldName = "field_name"
            case date, time
            case freeCancellationTime = "free_cancellation_time"
            case feesForCancellation = "fees_for_cancellation"
            case discount, price, booked
        }
    }

    // MARK: - Booked
    struct Booked: Codable {
        let status: Bool?
        let method: String?
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
    struct BookRes: Codable {
        let status: Bool?
        let msg: String?
    }


}
