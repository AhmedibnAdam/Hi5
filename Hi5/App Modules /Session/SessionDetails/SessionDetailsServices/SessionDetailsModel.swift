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
    // MARK: - SessionDetailsResponse
    struct SessionDetailsResponse: Codable {
        let status: Bool?
        let field: Field?
    }

    // MARK: - Field
    struct Field: Codable {
        let sessionID: Int?
        let date, startTime, endTime: String?
        let overnight: Bool?
        let id: Int?
        let name: String?
        let image: String?
        let images: [String]?
        let longitude, latitude, address, sport: String?
        let sportImage: String?
        let gender, genderMatch, bestFor: String?
        let cost, partnerID: Int?
        let partnerName: String?
        let partnerImage: String?
        let visibility, payment: String?
        let membership: Membership?
        let favourite: Bool?
        let fieldType: String?
        let bookingFrequencyTime: Int?
        let bookingFrequencyPer, frequencyBookMsg, onlineBookingCancelationMsg, onlineBookingCancelationFeeMsg: String?

       enum CodingKeys: String, CodingKey {
             case sessionID = "session_id"
             case date
             case startTime = "start_time"
             case endTime = "end_time"
             case overnight, id, name, image, images, longitude, latitude, address, sport
             case sportImage = "sport_image"
             case gender
             case genderMatch = "gender_match"
             case bestFor = "best_for"
             case cost
             case partnerID = "partner_id"
             case partnerName = "partner_name"
             case partnerImage = "partner_image"
             case visibility, payment, membership, favourite
             case fieldType = "field_type"
             case bookingFrequencyTime = "booking_frequency_time"
             case bookingFrequencyPer = "booking_frequency_per"
             case frequencyBookMsg = "frequency_book_msg"
             case onlineBookingCancelationMsg = "online_booking_cancelation_msg"
             case onlineBookingCancelationFeeMsg = "online_booking_cancelation_fee_msg"
         }
    }

    // MARK: - Membership
    struct Membership: Codable {
        let status, expireAt: String?

        enum CodingKeys: String, CodingKey {
            case status
            case expireAt
        }
    }


    // MARK: - Service
    struct Service: Codable {
        let name: String?
        let image: String?
    }
}
