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
        let name, email: String?
      
        let biography, gender, joinedAt, vieID: String?
        let avatar: String?
        let dateOfBirth: Int?
        let country, city, state: City?
        let isActive: Bool?
        let status: Int?
        let day, month, year: City?
        let latitude, longitude: Double?

        enum CodingKeys: String, CodingKey {
            case id, name, email
     
            case biography, gender
            case joinedAt = "joined_at"
            case vieID = "vie_id"
            case avatar
            case dateOfBirth = "date_of_birth"
            case country, city, state
            case isActive = "is_active"
            case status, day, month, year, latitude, longitude
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
        let distance, sportType: String?
        let recommendedFor: String?
        let fieldImage: String?
        let comments, rating: Int?
        let visibility: String?
        let payment: String?

        enum CodingKeys: String, CodingKey {
            case id, name, cost, gender, address, longitude, latitude, distance
            case sportType
            case recommendedFor
            case fieldImage
            case comments, rating, visibility, payment
        }
    }

    // MARK: - UserShowProfile
    struct PlayerShowProfile: Codable {
        let status: Bool?
        let user: FriendUser?
    }

    // MARK: - User
    struct FriendUser: Codable {
     let id: Int?
     let name, email: String?
     let phoneNumber: Int?
     let biography, gender, joinedAt, vieID: String?
     let avatar: String?
     let dateOfBirth: Int?
     let country, city, state: City?

     enum CodingKeys: String, CodingKey {
         case id, name, email
         case phoneNumber = "phone_number"
         case biography, gender
         case joinedAt = "joined_at"
         case vieID = "vie_id"
         case avatar
         case dateOfBirth = "date_of_birth"
         case country, city, state
     }
    }


    // MARK: - Sport
    struct Sport: Codable {
        let sportName: String?
        let icon: String?
        let sportType, position, createdAt: String?

        enum CodingKeys: String, CodingKey {
            case sportName = "sport_name"
            case icon
            case sportType = "sport_type"
            case position
            case createdAt = "created_at"
        }
    }

    struct FullPlayerShowProfile: Codable {
        let status: Bool?
        let user: FullUser?
    }

    // MARK: - User
    struct FullUser: Codable {
        let id: Int?
        let name, email: String?
        let phoneNumber: Int?
        let biography, gender, vieID: String?
        let avatar: String?
        let country, city, state: City?
        let dateOfBirth: String?
        let sports: [Sport]?

        enum CodingKeys: String, CodingKey {
            case id, name, email
            case phoneNumber = "phone_number"
            case biography, gender
            case vieID = "vie_id"
            case avatar, country, city, state
            case dateOfBirth = "date_of_birth"
            case sports
        }
    }


}
