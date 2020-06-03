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
    
    
    // MARK: - FieldDetails
    struct FieldDetails: Codable {
        let status: Bool?
        let field: FieldDetailsField?
    }
    
    // MARK: - Field
    struct FieldDetailsField: Codable {
        let id: Int?
        let name, partnerName: String?
        let partnerImage: String?
        let cost: Int?
        let longitude, latitude : String?
        let gender, address, distance, sportType: String?
        let recommendedFor: String?
        let fieldImage: String?
        let comments: Int?
        let rating: Double?
        let visibility, payment: String?
        let membership: FieldDetailsMembership?
        let favourite: Bool?
        let fieldDescription, fieldSize, fieldType: String?
        let image: String?
        let images: [String]?
        let services: [FieldDetailsService]?
        let partner_id: Int?

        

        enum CodingKeys: String, CodingKey {
            case id, name,longitude, latitude
            case partnerName = "partner_name"
            case partnerImage = "partner_image"
            case cost, gender, address, distance
            case sportType = "sport_type"
            case recommendedFor = "recommended_for"
            case fieldImage = "field_image"
            case comments, rating, visibility, payment, membership, favourite
            case fieldDescription = "description"
            case fieldSize = "field_size"
            case fieldType = "field_type"
            case image, images, services
            case partner_id

        }
    }
    // MARK: - Membership
    struct FieldDetailsMembership: Codable {
        let status, expireAt: String?
        
        enum CodingKeys: String, CodingKey {
            case status
            case expireAt = "expire_at"
        }
    }
    
    // MARK: - Service
    struct FieldDetailsService: Codable {
        let name: String?
        let image: String?
    }
    // MARK: - RequestMemberShipResponse
    struct RequestMemberShipResponse: Codable {
        let status: Bool?
        let msg: String?
    }

}

