//
//  NotificationSettingModel.swift
//  Hi5
//
//  Created by Adam on 12/31/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct NotificationSettingModel {	
	struct Request {
		// do someting...

		func parameters() -> [String: Any]? {
			// do someting...
			return nil
		}
	}

	// MARK: - NotificationsModel
    struct NotificationsModel: Codable {
        let status: Bool?
        let data: [Datum]?
        let total: Int?
        let onFirstPage: Bool?
        let perPage, currentPage, totalPages: Int?

        enum CodingKeys: String, CodingKey {
            case status, data, total
            case onFirstPage = "on_first_page"
            case perPage = "per_page"
            case currentPage = "current_page"
            case totalPages = "total_pages"
        }
    }

    // MARK: - Datum
    struct Datum: Codable {
        let id: Int?
        let title, message: String?
        let image: String?
        let date, time: String?
    }

}
