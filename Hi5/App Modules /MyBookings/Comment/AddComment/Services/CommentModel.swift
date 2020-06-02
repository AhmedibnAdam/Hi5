//
//  CommentModel.swift
//  Hi5
//
//  Created by Adam on 5/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct CommentModel {	
	struct Request {
		// do someting...

		func parameters() -> [String: Any]? {
			// do someting...
			return nil
		}
	}

	// MARK: - CommentResponse
    struct CommentResponse: Codable {
        let status: Bool?
        let msg: String?
    }
    // MARK: - LastComment
    struct LastComment: Codable {
        let status: Bool?
        let comment: Comment?
    }

    // MARK: - Comment
    struct Comment: Codable {
        let commentDescription, rate, date: String?

        enum CodingKeys: String, CodingKey {
            case commentDescription = "description"
            case rate, date
        }
    }

}
