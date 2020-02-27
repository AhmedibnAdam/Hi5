//
//  FieldsModel.swift
//  Hi5
//
//  Created by Adam on 12/26/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct FieldsModel {	
	struct Request {
		func parameters() -> [String: Any]? {
			return nil
		}
	}
    
    
    //MARK: - AddFavouriteResponse
    struct AddfavouriteResponse: Codable {
        let status: Bool?
        let msg: String?
    }
    
    //MARK: - RemoveFavouriteResponse
    struct RemovefavouriteResponse: Codable {
        let status: Bool?
        let msg: String?
    }
    
    // MARK: - NearByFieldResponse
    struct NearByfieldsResponse: Codable {
        let status: Bool?
        let fields: [Field]?
    }

    // MARK: - Field
    struct Field: Codable {
        let favourite: Bool?
        let id: Int?
        let name, partnerName: String?
        let partnerImage: String?
        let cost: Int?
        let gender, address, distance, sportType: String?
        let recommendedFor: String?
        let fieldImage: String?
        let comments, rating: Int?
        let visibility, payment: String?
        let membership: Membership?

        enum CodingKeys: String, CodingKey {
            case favourite, id, name
            case partnerName = "partner_name"
            case partnerImage = "partner_image"
            case cost, gender, address, distance
            case sportType = "sport_type"
            case recommendedFor = "recommended_for"
            case fieldImage = "field_image"
            case comments, rating, visibility, payment, membership
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
