//
//  SessionResultEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/5/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum SessionResultEndPoint {
    case checkAvailability(fieldId: Int , date: String)
}

//MARK: - Extension
extension SessionResultEndPoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .checkAvailability:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .checkAvailability:
            return "http://api-ksa.com/demo/hi5/public/api/player/" + "field/check_availability"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .checkAvailability(let fieldId, let date):
            return ["field_id": fieldId , "date": date]
        }
    }
    
    var image: UIImage? {
        switch self {
        case .checkAvailability:
            return nil
        }
    }
    
    var header: HTTPHeaders? {
        let defaults = UserDefaults.standard
        let token = defaults.string(forKey: "Token")
        return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .checkAvailability:
            return JSONEncoding.default
        }
    }
}
