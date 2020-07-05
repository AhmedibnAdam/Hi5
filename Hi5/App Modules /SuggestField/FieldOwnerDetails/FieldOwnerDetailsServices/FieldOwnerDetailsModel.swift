//
//  FieldOwnerDetailsModel.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct FieldOwnerDetailsModel {	
	struct Request {
		func parameters() -> [String: Any]? {
			return nil
		}
	}

	struct AddSuggestFieldResponse: Codable {
        let status: Bool?
        let field: Field?
    }

    // MARK: - Field
    struct Field: Codable {
        let id: Int?
        let longitude, latitude, fieldName, bestFor: String?
        let ownerName, ownerPhoneNumber, comments: String?
        let images: [String]?

        enum CodingKeys: String, CodingKey {
            case id, longitude, latitude
            case fieldName = "field_name"
            case bestFor = "best_for"
            case ownerName = "owner_name"
            case ownerPhoneNumber = "owner_phone_number"
            case comments, images
        }
    }
}
