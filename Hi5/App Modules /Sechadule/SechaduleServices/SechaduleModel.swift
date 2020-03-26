//
//  SechaduleModel.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/14/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct SechaduleModel {	
	struct Request {
		// do someting...

		func parameters() -> [String: Any]? {
			// do someting...
			return nil
		}
	}

	 // MARK: - SechaduleSessions
       struct SechaduleSessions: Codable {
           let status: Bool?
           let fields: [SechaduleSessionsField]?
       }

       // MARK: - PublicEvent
       struct SechaduleSessionsField: Codable {
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
       
       // MARK: - CanceledSechaduleResponse
       struct CanceledSechaduleResponse: Codable {
           let status: Bool?
           let fields: [CanceledSechaduleField]?
       }

       // MARK: - Field
       struct CanceledSechaduleField: Codable {
           let bookedSessionID, id: Int?
           let name: String?
           let image: String?
           let day, date, startTime, endTime: String?
           let gender, address, bestFor, status: String?
           let payment, partnerName: String?
           let partnerImage: String?
           let oldPrice, newPrice, points: Int?

           enum CodingKeys: String, CodingKey {
               case bookedSessionID = "booked_session_id"
               case id, name, image, day, date
               case startTime = "start_time"
               case endTime = "end_time"
               case gender, address
               case bestFor = "best_for"
               case status, payment
               case partnerName = "partner_name"
               case partnerImage = "partner_image"
               case oldPrice = "old_price"
               case newPrice = "new_price"
               case points
           }
       }
       // MARK: - PastSechaduleResponse
       struct PastSechaduleResponse: Codable {
           let status: Bool?
           let fields: [PastSechaduleField]?
       }

       // MARK: - Field
       struct PastSechaduleField: Codable {
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
}
