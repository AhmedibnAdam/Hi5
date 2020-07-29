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
       let bookedSessionID: Int?
         let bookedSessionDate, bookedSessionPayment: String?
         let id: Int?
         let name: String?
         let image: String?
         let date, startTime, endTime: String?
         let overnight: Bool?
         let gender, genderMatch: String?
         let membership: Membership?
         let visibility, address: String?
         let favourite: Bool?
         let bestFor, sport: String?
         let sportImage: String?
         let status, payment: String?
         let partnerID: Int?
         let partnerName: String?
         let partnerImage: String?
         let partnerPhone: String?
         let basePrice, discount, priceAfterDiscount, couponDiscount: Double?
         let priceAfterCouponDiscount, taxPercent, priceAfterTax, totalPrice: Double?
         let bookingFrequencyTime: Int?
         let bookingFrequencyPer, frequencyBookMsg, onlineBookingCancelationMsg, onlineBookingCancelationFeeMsg: String?
         let points: Int?

        enum CodingKeys: String, CodingKey {
             case bookedSessionID = "booked_session_id"
             case bookedSessionDate = "booked_session_date"
             case bookedSessionPayment = "booked_session_payment"
             case id, name, image, date
             case startTime = "start_time"
             case endTime = "end_time"
             case overnight, gender
             case genderMatch = "gender_match"
             case membership, visibility, address, favourite
             case bestFor = "best_for"
             case sport
             case sportImage = "sport_image"
             case status, payment
             case partnerID = "partner_id"
             case partnerName = "partner_name"
             case partnerImage = "partner_image"
             case partnerPhone = "partner_phone"
             case basePrice = "base_price"
             case discount
             case priceAfterDiscount = "price_after_discount"
             case couponDiscount = "coupon_discount"
             case priceAfterCouponDiscount = "price_after_coupon_discount"
             case taxPercent = "tax_percent"
             case priceAfterTax = "price_after_tax"
             case totalPrice = "total_price"
             case bookingFrequencyTime = "booking_frequency_time"
             case bookingFrequencyPer = "booking_frequency_per"
             case frequencyBookMsg = "frequency_book_msg"
             case onlineBookingCancelationMsg = "online_booking_cancelation_msg"
             case onlineBookingCancelationFeeMsg = "online_booking_cancelation_fee_msg"
             case points
        }
    }


}
