//
//  AllCommentsModel.swift
//  Hi5
//
//  Created by Adam on 5/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct AllCommentsModel {	
	struct Request {
		// do someting...

		func parameters() -> [String: Any]? {
			// do someting...
			return nil
		}
	}

	
    // MARK: - Comments
    struct Comments: Codable {
        let status: Bool?
        let comments: [Comment]?
        let rates: [Rate]?
        let meta: Meta?
    }

    // MARK: - Comment
    struct Comment: Codable {
        let id: Int?
        let player: String?
        let playerImage: String?
        let commentDescription, rate, date: String?

        enum CodingKeys: String, CodingKey {
            case id, player
            case playerImage = "player_image"
            case commentDescription = "description"
            case rate, date
        }
    }

    // MARK: - Meta
    struct Meta: Codable {
        let totalRateCount: Int?
        let ratingAvg: Double?

        enum CodingKeys: String, CodingKey {
            case totalRateCount = "total_rate_count"
            case ratingAvg = "rating_avg"
        }
    }

    // MARK: - Rate
    struct Rate: Codable {
        let rate, reviewersCount: Int?

        enum CodingKeys: String, CodingKey {
            case rate
            case reviewersCount = "reviewers_count"
        }
    }

}
