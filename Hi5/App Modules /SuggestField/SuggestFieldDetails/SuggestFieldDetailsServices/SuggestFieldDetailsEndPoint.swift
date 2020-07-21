//
//  SuggestFieldDetailsEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/26/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum SuggestFieldDetailsEndPoint {
    case getSuggestField
}

//MARK: - Extension

extension SuggestFieldDetailsEndPoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .getSuggestField:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getSuggestField:
            return Constant.base + "player/" + "suggestion_field_data"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .getSuggestField:
            return ["":""]
        }
    }
    
    var image: UIImage? {
        switch self {
        case .getSuggestField:
            return nil
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .getSuggestField:
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getSuggestField:
            return URLEncoding.default
        }
    }
}
