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
        let partnerName: String?
        let partnerImage: String?
        let playersNumber, joinedNumber: Int?
        let cost, date, dateFormat, time: String?
        let sportType, status, age: String?
        
        enum CodingKeys: String, CodingKey {
            case id
            case fieldName = "field_name"
            case fieldImage = "field_image"
            case partnerName = "partner_name"
            case partnerImage = "partner_image"
            case playersNumber = "players_number"
            case joinedNumber = "joined_number"
            case cost, date
            case dateFormat = "date_format"
            case time
            case sportType = "sport_type"
            case status, age
        }
    }
}
