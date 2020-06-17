//
//  FilterResultModel.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/26/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct FilterResultModel {
    struct Request {
        func parameters() -> [String: Any]? {
            return nil
        }
    }
    

    struct FilterSessionResponse: Codable {
        let status: Bool?
        let fields: [FilterField]?
    }

    // MARK: - Field
    struct FilterField: Codable {
        let sessionID, id: Int?
         let name: String?
         let image: String?
         let address, sport, gender, bestFor: String?
         let partnerID: Int?
         let partnerName: String?
         let partnerImage: String?
         let visibility, payment: String?
         let membership: Membership?
         let favourite: Bool?
         let distance, day, date, startTime: String?
         let endTime: String?
         let points: Int?
         let oldPrice, newPrice: Double?

         enum CodingKeys: String, CodingKey {
             case sessionID = "session_id"
             case id, name, image, address, sport, gender
             case bestFor = "best_for"
             case partnerID = "partner_id"
             case partnerName = "partner_name"
             case partnerImage = "partner_image"
             case visibility, payment, membership, favourite, distance, day, date
             case startTime = "start_time"
             case endTime = "end_time"
             case points
             case oldPrice = "old_price"
             case newPrice = "new_price"
         }
    }

    // MARK: - Membership
    struct Membership: Codable {
        let status, expireAt: String?

        enum CodingKeys: String, CodingKey {
            case status
            case expireAt = "expire_at"
        }
    }
}
