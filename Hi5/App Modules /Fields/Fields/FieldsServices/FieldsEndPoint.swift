//
//  FieldsEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/18/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum FieldsEndpoint {
    case nearBy(lon: Double , lat: Double)
    case favourite
    case memberOf
}

//MARK: - Extension
extension FieldsEndpoint: IEndpoint{
    var method: HTTPMethod {
        switch self {
        case .nearBy:
            return .get
        case .favourite:
            return .get
        case .memberOf:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .nearBy:
            return "http://api-ksa.com/demo/hi5/public/api/player/" + "near_by_fields"
        case .favourite:
            return "http://api-ksa.com/demo/hi5/public/api/player/" + "get_favourite_fields"
        case .memberOf:
            return "http://api-ksa.com/demo/hi5/public/api/player/" + "get_memberShip"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .nearBy(let lon , let lat):
            return ["longitude": lon , "latitude": lat]
        case .favourite:
            return ["":""]
        case .memberOf:
            return ["":""]
        }
    }
    
    var image: UIImage? {
        switch self {
        case .nearBy:
            return nil
        case .favourite:
            return nil
        case .memberOf:
            return nil
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .nearBy:
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        case .favourite:
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        case .memberOf:
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .nearBy:
            return URLEncoding.default
        case .favourite:
            return URLEncoding.default
        case .memberOf:
            return URLEncoding.default
        }
    }
}