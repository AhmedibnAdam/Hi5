//
//  ShowDetailsModel.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/22/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct ShowDetailsModel {	
	struct Request {
		func parameters() -> [String: Any]? {
			return nil
		}
	}
    
    //MARK: - RequestMemberShipResponse
    struct RequestMemberShipResponse: Codable {
        let status: Bool?
        let msg: String?
    }

    //MARK: - ShowDetailsResponse
	struct ShowDetailsResponse: Codable {
        let status: Bool?
        let field: Field?
    }

    // MARK: - Field
    struct Field: Codable {
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
        let fieldDescription, fieldSize, fieldType: String?
        let image: String?
        let images: [String]?
        let services: [Service]?

        enum CodingKeys: String, CodingKey {
            case id, name
            case partnerName = "partner_name"
            case partnerImage = "partner_image"
            case cost, gender, address, distance
            case sportType = "sport_type"
            case recommendedFor = "recommended_for"
            case fieldImage = "field_image"
            case comments, rating, visibility, payment, membership
            case fieldDescription = "description"
            case fieldSize = "field_size"
            case fieldType = "field_type"
            case image, images, services
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

