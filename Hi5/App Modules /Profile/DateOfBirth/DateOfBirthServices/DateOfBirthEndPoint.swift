//
//  DateOfBirthEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/4/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum DateOfBirthEndPoint {
    case dateOfBirth(year: String , yearFlag: String , month: String , monthFlag: String , day: String , dayFlag: String)
}
//MARK: - Extensions
extension DateOfBirthEndPoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .dateOfBirth:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .dateOfBirth:
            return "http://api-ksa.com/demo/hi5/public/api/player/" + "edit_profile"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .dateOfBirth(let year , let yearFlag , let month , let monthFlag , let day , let dayFlag):
            return ["year": year , "yearFlag": yearFlag , "month": month , "monthFlag": monthFlag , "day": day , "dayFlag": dayFlag]
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .dateOfBirth:
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .dateOfBirth:
            return JSONEncoding.default
        }
    }
}
