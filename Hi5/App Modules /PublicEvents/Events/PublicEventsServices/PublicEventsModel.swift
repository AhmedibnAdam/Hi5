//
//  PublicEventsModel.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct PublicEventsModel {
    struct Request {
        func parameters() -> [String: Any]? {
            // do someting...
            return nil
        }
    }
    // MARK: - PublicEventResponse
    struct PublicEventResponse: Codable {
        let status: Bool
        let publicEvents: [PublicEvent]
    }

    // MARK: - PublicEvent
    struct PublicEvent: Codable {

        
        let id, fieldName: String?
           let fieldImage: String?
           let bestFor, address, partnerName: String?
           let partnerImage: String?
           let playersNumber, joinedCount: Int?
            let cost : Double?
           let gender, day, date, startTime: String?
           let endTime, sportType, groupName: String?
           let age: Int?
           let payment: String?
           let points: Int?
        let partner_id: Int?

        enum CodingKeys: String, CodingKey {
                 case id
                 case fieldName = "field_name"
                 case fieldImage = "field_image"
                 case bestFor = "best_for"
                 case address
                 case partnerName = "partner_name"
                 case partnerImage = "partner_image"
                 case playersNumber = "players_number"
                 case joinedCount = "joined_count"
                 case cost, gender, day, date
                 case startTime = "start_time"
                 case endTime = "end_time"
                 case sportType = "sport_type"
                 case groupName = "group_name"
                 case age, payment, points ,partner_id
        }
    }
    struct shohrtageProfileResponse: Codable {
          let status: Bool
          let msg: String
      }

}
