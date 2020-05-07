//
//  PublicEventDetailsModel.swift
//  Hi5
//
//  Created by Adam on 4/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct PublicEventDetailsModel {
    struct Request {
        // do someting...
        
        func parameters() -> [String: Any]? {
            // do someting...
            return nil
        }
    }
    
    
  
    // MARK: - PublicEventDetails
    struct PublicEventDetails: Codable {
        let status: Bool?
        let publicEvent: PublicEvent?

        enum CodingKeys: String, CodingKey {
            case status
            case publicEvent = "public_event"
        }
    }

    // MARK: - PublicEvent
    struct PublicEvent: Codable {
        let id, fieldName: String?
        let fieldImage: String?
        let bestFor, address, partnerName: String?
        let partnerImage: String?
        let playersNumber, joinedCount, cost: Int?
        let gender, day, date, startTime: String?
        let endTime, sportType, groupName: String?
        let age: Int?
        let payment: String?
        let points: Int?
        let status, fieldType, fieldSize: String?
        let guaranteedRefundTime: Int?
        let feeForCancelation: String?
        let countEssentialPlayer: Int?
        let createrName, createrImage, createrUsername, playerEventStatus: String?
        let players: [Player]?

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
            case age, payment, points, status
            case fieldType = "field_type"
            case fieldSize = "field_size"
            case guaranteedRefundTime = "guaranteed_refund_time"
            case feeForCancelation = "fee_for_cancelation"
            case countEssentialPlayer = "count_essential_player"
            case createrName = "creater_name"
            case createrImage = "creater_image"
            case createrUsername = "creater_username"
            case playerEventStatus = "player_event_status"
            case players
        }
    }
    // MARK: - Player
    struct Player: Codable {
        let name, userName, image, eventStatus: String?

        enum CodingKeys: String, CodingKey {
            case name
            case userName = "user_name"
            case image
            case eventStatus = "event_status"
        }
    }
}
