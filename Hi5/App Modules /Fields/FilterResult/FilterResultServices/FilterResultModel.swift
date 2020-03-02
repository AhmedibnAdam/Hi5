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
        let fields: [Field]?
    }

    // MARK: - Field
    struct Field: Codable {
        let sessionID, id: Int?
        let name: String?
        let image: String?
        let images: [String]?
        let fieldDescription, address, date, dateFormat: String?
        let time, sport, gender, bestFor: String?
        let cost: Int?
        let partnerName: String?
        let partnerImage: String?
        let visibility, payment: String?
        let membership: Membership?
        let favourite: Bool?

        enum CodingKeys: String, CodingKey {
            case sessionID = "session_id"
            case id, name, image, images
            case fieldDescription = "description"
            case address, date
            case dateFormat = "date_format"
            case time, sport, gender
            case bestFor = "best_for"
            case cost
            case partnerName = "partner_name"
            case partnerImage = "partner_image"
            case visibility, payment, membership, favourite
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
