//
//  FilterendPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/1/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum FilterEndPoint {
    case suggestionField
}

//MARK: - Extension
extension FilterEndPoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .suggestionField:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .suggestionField:
            return "http://api-ksa.com/demo/hi5/public/api/player/" + "suggestion_field_data"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .suggestionField:
            return ["":""]
        }
    }
    
    var image: UIImage? {
        switch self {
        case .suggestionField:
            return nil
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .suggestionField:
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .suggestionField:
            return URLEncoding.default
        }
    }
}
