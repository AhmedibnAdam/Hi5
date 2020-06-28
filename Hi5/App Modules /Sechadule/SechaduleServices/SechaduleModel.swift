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
           let public_events: [SechaduleSessionsField]?
       }

       // MARK: - PublicEvent
       struct SechaduleSessionsField: Codable {
       let id, joinedPublicEventID: Int?
             let fieldName: String?
             let fieldImage: String?
             let bestFor: String?
             let address: String?
             let partnerName: String?
             let partnerImage: String?
             let playersNumber: Int?
             let day, date, startTime, endTime: String?
             let sportType: String?
             let status: String?
             let groupName: String?
             let age, joinedCount: Int?
             let gender: Gender?
             let cost: Int?
             let paymentMethodStatus: String?
             let paymentStatus: String?
             let points: Int?

             enum CodingKeys: String, CodingKey {
                 case id
                 case joinedPublicEventID = "joined_public_event_id"
                 case fieldName = "field_name"
                 case fieldImage = "field_image"
                 case bestFor = "best_for"
                 case address
                 case partnerName = "partner_name"
                 case partnerImage = "partner_image "
                 case playersNumber = "players_number"
                 case day, date
                 case startTime = "start_time"
                 case endTime = "end_time"
                 case sportType = "sport_type"
                 case status
                 case groupName = "group_name"
                 case age
                 case joinedCount = "joined_count"
                 case gender, cost
                 case paymentMethodStatus = "payment_method_status"
                 case paymentStatus = "payment_status"
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
           let public_events: [CanceledSechaduleField]?
       }

       // MARK: - Field
       struct CanceledSechaduleField: Codable {
      let id, joinedPublicEventID: Int?
            let fieldName: String?
            let fieldImage: String?
            let bestFor: String?
            let address: String?
            let partnerName: String?
            let partnerImage: String?
            let playersNumber: Int?
            let day, date, startTime, endTime: String?
            let sportType: String?
            let status: String?
            let groupName: String?
            let age, joinedCount: Int?
            let gender: Gender?
            let cost: Int?
            let paymentMethodStatus: String?
            let paymentStatus: String?
            let points: Int?

            enum CodingKeys: String, CodingKey {
                case id
                case joinedPublicEventID = "joined_public_event_id"
                case fieldName = "field_name"
                case fieldImage = "field_image"
                case bestFor = "best_for"
                case address
                case partnerName = "partner_name"
                case partnerImage = "partner_image "
                case playersNumber = "players_number"
                case day, date
                case startTime = "start_time"
                case endTime = "end_time"
                case sportType = "sport_type"
                case status
                case groupName = "group_name"
                case age
                case joinedCount = "joined_count"
                case gender, cost
                case paymentMethodStatus = "payment_method_status"
                case paymentStatus = "payment_status"
                case points
            }
        }

    

        enum Gender: String, Codable {
            case both = "both"
            case female = "female"
            case male = "male"
        }



       // MARK: - PastSechaduleResponse
       struct PastSechaduleResponse: Codable {
           let status: Bool?
           let public_events: [PastSechaduleField]?
       }

       // MARK: - Field
       struct PastSechaduleField: Codable {
       let id, joinedPublicEventID: Int?
             let fieldName: String?
             let fieldImage: String?
             let bestFor: String?
             let address: String?
             let partnerName: String?
             let partnerImage: String?
             let playersNumber: Int?
             let day, date, startTime, endTime: String?
             let sportType: String?
             let status: String?
             let groupName: String?
             let age, joinedCount: Int?
             let gender: Gender?
             let cost: Int?
             let paymentMethodStatus: String?
             let paymentStatus: String?
             let points: Int?

             enum CodingKeys: String, CodingKey {
                 case id
                 case joinedPublicEventID = "joined_public_event_id"
                 case fieldName = "field_name"
                 case fieldImage = "field_image"
                 case bestFor = "best_for"
                 case address
                 case partnerName = "partner_name"
                 case partnerImage = "partner_image "
                 case playersNumber = "players_number"
                 case day, date
                 case startTime = "start_time"
                 case endTime = "end_time"
                 case sportType = "sport_type"
                 case status
                 case groupName = "group_name"
                 case age
                 case joinedCount = "joined_count"
                 case gender, cost
                 case paymentMethodStatus = "payment_method_status"
                 case paymentStatus = "payment_status"
                 case points
             }
         }
}
