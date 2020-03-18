//
//  FilterModel.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct FilterModel {	
	struct Request {
		func parameters() -> [String: Any]? {
			return nil
		}
	}

	struct SuggestionFieldResponse: Codable {
        let status: Bool?
        let data: DataClass?
    }

    // MARK: - DataClass
    struct DataClass: Codable {
        let sports: [Sport]?
        let floors: [Floor]?
    }

    // MARK: - Floor
    struct Floor: Codable {
        let id: Int?
        let name: String?
    }

    // MARK: - Sport
    struct Sport: Codable {
        let id: Int?
        let name: String?
        let icon: String?
    }

}
