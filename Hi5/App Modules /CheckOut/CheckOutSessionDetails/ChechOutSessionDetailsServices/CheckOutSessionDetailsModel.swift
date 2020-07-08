//
//  CheckOutSessionDetailsModel.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct CheckOutSessionDetailsModel {
    struct Request {
        // do someting...

        func parameters() -> [String: Any]? {
            // do someting...
            return nil
        }
    }
    
    // MARK: - CheckOut
    struct CheckOut: Codable {
        let status: Bool?
        let session: Session?
    }

    // MARK: - Session
    struct Session: Codable {
        let id: Int
        let partnerName, fieldName, date, time: String
        let freeCancellationTime, feesForCancellation, proCode: Int
        let basePrice, discount, sessionPrice, subTotal: Double
        let taxPercent: Int
        let tax, totalPrice: Double
        let booked: Booked
        let timeControllBook: Bool
        let timeControllBookingMsg: String
        let frequencyBook: Bool
        let frequencyBookMsg: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case partnerName = "partner_name"
            case fieldName = "field_name"
            case date, time
            case freeCancellationTime = "free_cancellation_time"
            case feesForCancellation = "fees_for_cancellation"
            case proCode = "pro_code"
            case basePrice = "base_price"
            case discount
            case sessionPrice = "session_price"
            case subTotal = "sub_total"
            case taxPercent = "tax_percent"
            case tax
            case totalPrice = "total_price"
            case booked
            case timeControllBook = "time_controll_book"
            case timeControllBookingMsg = "time_controll_booking_msg"
            case frequencyBook = "frequency_book"
            case frequencyBookMsg = "frequency_book_msg"
        }
    }

    // MARK: - Booked
    struct Booked: Codable {
           let status: Bool?
         let method: String?
         let canBook: Bool?

         enum CodingKeys: String, CodingKey {
             case status, method
             case canBook = "can_book"
         }
    }

    // MARK: - PublicEventDetailsJoin
    struct PublicEventDetailsJoin: Codable {
        let status: Bool
        let joined: Joined
    }

    // MARK: - Joined
    struct Joined: Codable {
        let id: Int
        let payment, status: String
    }
    struct BookRes: Codable {
        let status: Bool?
        let msg: String?
    }


}
