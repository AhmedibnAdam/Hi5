//
//  BookingDetailsModel.swift
//  Hi5
//
//  Created by Adam on 5/11/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct BookingDetailsModel {	
	struct Request {
		// do someting...

		func parameters() -> [String: Any]? {
			// do someting...
			return nil
		}
	}

	// MARK: - BookedDetails
    struct BookedDetails: Codable {
        let status: Bool?
        let field: BookedDetailsField?
    }

    // MARK: - Field
    struct BookedDetailsField: Codable {
        let payment, paymentStatus, fieldSize, fieldType: String?
        let services: [Service]?
        let cost, bookedSessionID, id: Int?
        let name: String?
        let image: String?
        let day, date, startTime, endTime: String?
        let gender, address, bestFor, sport: String?
        let status, partnerName: String?
        let partnerImage: String?
        let oldPrice, newPrice, points: Int?

        enum CodingKeys: String, CodingKey {
            case payment
            case paymentStatus = "payment status"
            case fieldSize = "field_size"
            case fieldType = "field_type"
            case services, cost
            case bookedSessionID = "booked_session_id"
            case id, name, image, day, date
            case startTime = "start_time"
            case endTime = "end_time"
            case gender, address
            case bestFor = "best_for"
            case sport, status
            case partnerName = "partner_name"
            case partnerImage = "partner_image"
            case oldPrice = "old_price"
            case newPrice = "new_price"
            case points
        }
    }

    // MARK: - Service
    struct Service: Codable {
        let name: String?
        let image: String?
    }
}
