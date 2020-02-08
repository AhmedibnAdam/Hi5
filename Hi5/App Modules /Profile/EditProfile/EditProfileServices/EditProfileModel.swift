//
//  EditProfileModel.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/20/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct EditProfileModel {	
	struct Request {
		func parameters() -> [String: Any]? {
			return nil
		}
	}

	struct EditProfileResponse: Codable {
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
        let latitude, longitude: Int?

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
}
