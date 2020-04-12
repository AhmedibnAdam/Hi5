//
//  SessionDetailsModel.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/5/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct SessionDetailsModel {	
	struct Request {
		func parameters() -> [String: Any]? {
			return nil
		}
	}
    
    // MARK: - FieldContactsResponse
    struct FieldContactsResponse: Codable {
        let status: Bool?
        let fieldContacts: [FieldContact]?

        enum CodingKeys: String, CodingKey {
            case status
            case fieldContacts = "field_contacts"
        }
    }

    // MARK: - FieldContact
    struct FieldContact: Codable {
        let name, phone: String?
    }

	struct SessionDetailsResponse: Codable {
        let status: Bool?
        let field: Field?
    }

    // MARK: - Field
    struct Field: Codable {
        let sessionID: Int?
        let date, dateFormat, time: String?
        let id: Int?
        let name: String?
        let image: String?
        let images: [String]?
        let fieldDescription, address, sport, gender: String?
        let bestFor: String?
        let cost: Int?
        let partnerName: String?
        let partnerImage: String?
        let visibility, payment: String?
        let membership: Membership?
        let favourite: Bool?
        let fieldSize, fieldType, bookingFrequencyPolicy: String?
        let services: [Service]?

        enum CodingKeys: String, CodingKey {
            case sessionID = "session_id"
            case date
            case dateFormat = "date_format"
            case time, id, name, image, images
            case fieldDescription = "description"
            case address, sport, gender
            case bestFor = "best_for"
            case cost
            case partnerName = "partner_name"
            case partnerImage = "partner_image"
            case visibility, payment, membership, favourite
            case fieldSize = "field_size"
            case fieldType = "field_type"
            case bookingFrequencyPolicy = "booking_frequency_policy"
            case services
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

    // MARK: - Service
    struct Service: Codable {
        let name: String?
        let image: String?
    }
}
