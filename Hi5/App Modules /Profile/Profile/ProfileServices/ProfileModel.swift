//
//  ProfileModel.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct ProfileModel {	
	struct Request {
		func parameters() -> [String: Any]? {
			return nil
		}
	}
  
    // MARK: - ShowProfileResponse
    struct ShowProfileResponse: Codable {
        let status: Bool?
        let user: User?
    }

    // MARK: - User
    struct User: Codable {
        let id: Int?
        let name: String?
        let email: String?
        let gender, vieID: String?
        let phoneNumber: Int?
        let isActive: Bool?
        let createdAt: String?
        let status: Int?
        let biography: String?
        let avatar: String?
        let year, month, day, country: City?
        let city, state: City?
        let latitude: Double?
        let longitude: Int?

        enum CodingKeys: String, CodingKey {
            case id, name, email, gender
            case vieID = "vie_id"
            case phoneNumber = "phone_number"
            case isActive = "is_active"
            case createdAt = "created_at"
            case status, biography, avatar, year, month, day, country, city, state, latitude, longitude
        }
    }

    // MARK: - City
    struct City: Codable {
        let val, flag: String?
    }

    // MARK: - PartnerProfile
    struct PartnerProfile: Codable {
        let status: Bool?
        let partner: Partner?
    }

    // MARK: - Partner
    struct Partner: Codable {
        let id: Int?
        let name, phone, email: String?
        let image: String?
        let fields: [Field]?
    }

    // MARK: - Field
    struct Field: Codable {
        let id: Int?
        let name: String?
        let cost: Int?
        let gender: String?
        let address: String?
        let longitude, latitude: String?
        let distance, sportType, recommendedFor: String?
        let fieldImage: String?
        let comments: Int?
        let rating: Double?
        let visibility: String?
        let payment: String?

        enum CodingKeys: String, CodingKey {
            case id, name, cost, gender, address, longitude, latitude, distance
            case sportType = "sport_type"
            case recommendedFor = "recommended_for"
            case fieldImage = "field_image"
            case comments, rating, visibility, payment
        }
    }




}
