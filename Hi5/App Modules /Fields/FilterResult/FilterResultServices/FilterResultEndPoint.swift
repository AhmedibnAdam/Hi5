//
//  FilterResultEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/1/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum FilterResultEndPoint {
    case filterSession(parameter: [String: Any])
}

//MARK: - Extension
extension FilterResultEndPoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .filterSession:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .filterSession:
            return "http://api-ksa.com/demo/hi5/public/api/player/" + "filter_session"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .filterSession(let parameter):
            return parameter
        }
    }
    
    var image: UIImage? {
        switch self {
        case .filterSession:
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
        case .filterSession:
            return JSONEncoding.default
        }
    }
}
