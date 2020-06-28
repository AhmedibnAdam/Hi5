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
        let day, date, startTime, endTime: String?
        let gender, address, bestFor, sport: String?
        let status, payment, partnerName: String?
        let partnerImage: String?
        let oldPrice, newPrice, points: Int?

        enum CodingKeys: String, CodingKey {
            case bookedSessionID = "booked_session_id"
            case id, name, image, day, date
            case startTime = "start_time"
            case endTime = "end_time"
            case gender, address
            case bestFor = "best_for"
            case sport, status, payment
            case partnerName = "partner_name"
            case partnerImage = "partner_image"
            case oldPrice = "old_price"
            case newPrice = "new_price"
            case points
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
    
    // MARK: - CanceledBookingResponse
    struct CanceledBookingResponse: Codable {
        let status: Bool?
        let fields: [CanceledBookingField]?
    }

    // MARK: - Field
    struct CanceledBookingField: Codable {
          let bookedSessionID, id: Int
        let name: String?
        let image: String?
        let day, date, startTime, endTime: String?
        let gender, address, bestFor, sport: String?
        let status, payment, partnerName: String?
        let partnerImage: String?
        let  points: Int?
        let oldPrice, newPrice : Double?
        enum CodingKeys: String, CodingKey {
            case bookedSessionID = "booked_session_id"
            case id, name, image, day, date
            case startTime = "start_time"
            case endTime = "end_time"
            case gender, address
            case bestFor = "best_for"
            case sport, status, payment
            case partnerName = "partner_name"
            case partnerImage = "partner_image"
            case oldPrice = "old_price"
            case newPrice = "new_price"
            case points
        }
    }
    // MARK: - PastBookingResponse
    struct PastBookingResponse: Codable {
        let status: Bool?
        let fields: [PastBookingField]?
    }

    // MARK: - Field
    struct PastBookingField: Codable {
      let bookedSessionID, id: Int?
        let name: String?
        let image: String?
        let day, date, startTime, endTime: String?
        let gender, address, bestFor, sport: String?
        let status, payment, partnerName: String?
        let partnerImage: String?
         let  points: Int?
               let oldPrice, newPrice : Double?

        enum CodingKeys: String, CodingKey {
            case bookedSessionID = "booked_session_id"
            case id, name, image, day, date
            case startTime = "start_time"
            case endTime = "end_time"
            case gender, address
            case bestFor = "best_for"
            case sport, status, payment
            case partnerName = "partner_name"
            case partnerImage = "partner_image"
            case oldPrice = "old_price"
            case newPrice = "new_price"
            case points
        }
    }


}
