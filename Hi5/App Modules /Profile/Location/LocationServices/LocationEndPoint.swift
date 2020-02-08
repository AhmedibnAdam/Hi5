//
//  LocationEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/4/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum LocationEndPoint {
    case location(country: String , countryFlag: String , city: String , cityFlag: String , state: String , stateFlag: String)
}
//MARK: - Extensions
extension LocationEndPoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .location:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .location:
            return "http://api-ksa.com/demo/hi5/public/api/player/" + "edit_profile"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .location(let country , let countryFlag , let city , let cityFlag , let state , let stateFlag):
            return ["country": country , "countryFlag": countryFlag , "city": city , "cityFlag": cityFlag , "state": state , "stateFlag": stateFlag]
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .location:
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .location:
            return JSONEncoding.default
        }
    }
}
