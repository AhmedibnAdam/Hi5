//
//  LocationModel.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/26/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct LocationModel {	
	struct Request {
		func parameters() -> [String: Any]? {
			return nil
		}
	}

    struct LocationEditProfileResponse: Codable {
        let status: Bool?
        let user: User?
    }

    // MARK: - User
    struct User: Codable {
     let id: Int?
        let name, email: String?
        let phoneNumber: Int?
        let biography, gender, vieID: String?
        let avatar: String?
        let country, city, state: City?
        let isActive: Bool?
        let createdAt: String?
        let status: Int?
        let day, month, year: City?
        let latitude: Double?
        let longitude: Int?

        enum CodingKeys: String, CodingKey {
            case id, name, email
                   case phoneNumber = "phone_number"
                   case biography, gender
                   case vieID = "vie_id"
                   case avatar, country, city, state
                   case isActive = "is_active"
                   case createdAt = "created_at"
                   case status, day, month, year, latitude, longitude
        }
    }

    // MARK: - City
    struct City: Codable {
        let val, flag: String?
    }
}
