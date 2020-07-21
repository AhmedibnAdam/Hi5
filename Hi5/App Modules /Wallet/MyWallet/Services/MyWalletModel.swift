//
//  MyWalletModel.swift
//  Hi5
//
//  Created by Adam on 4/17/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

struct MyWalletModel {
    struct Request {
        // do someting...

        func parameters() -> [String: Any]? {
            // do someting...
            return nil
        }
    }

    
    
    // MARK: - Wallet
    struct Wallet: Codable {
        let status: Bool?
        let data: DataClass?
    }

    // MARK: - DataClass
    struct DataClass: Codable {
        let transactions: [Transaction]?
        let meta: Meta?
    }

    // MARK: - Meta
    struct Meta: Codable {
        let totalRefund: Int?

        enum CodingKeys: String, CodingKey {
            case totalRefund = "total_refund"
        }
    }

    // MARK: - Transaction
    struct Transaction: Codable {
        let id, refund: Int?
        let transactionType, date, time, type: String?

        enum CodingKeys: String, CodingKey {
            case id, refund
            case transactionType = "transaction_type"
            case date, time, type
        }
    }


}
