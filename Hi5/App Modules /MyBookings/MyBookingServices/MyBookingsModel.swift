//
//  MyBookingsModel.swift
//  Hi5
//
//  Created by Adam on 3/18/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct MyBookingsModel {	
	struct Request {
		// do someting...

		func parameters() -> [String: Any]? {
			// do someting...
			return nil
		}
	}

    // MARK: - MyBookingSessions
    struct MyBookingSessions: Codable {
        let status: Bool?
        let fields: [MyBookingSessionsField]?
    }

    // MARK: - PublicEvent
    struct MyBookingSessionsField: Codable {
        let bookedSessionID, id: Int?
        let name: String?
        let image: String?
        let address, date, dateFormat, time: String?
        let gender, bestFor, sport, partnerName: String?
        let partnerImage: String?
        let visibility: String?
        let membership: Membership?
        let favourite: Bool?
        let status, statusDesc: String?

        enum CodingKeys: String, CodingKey {
            case bookedSessionID = "booked_session_id"
            case id, name, image, address, date
            case dateFormat = "date_format"
            case time, gender
            case bestFor = "best_for"
            case sport
            case partnerName = "partner_name"
            case partnerImage = "partner_image"
            case visibility, membership, favourite, status
            case statusDesc = "status_desc"
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
