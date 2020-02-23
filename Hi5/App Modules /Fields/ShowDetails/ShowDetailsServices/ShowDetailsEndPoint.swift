//
//  ShowDetailsEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/23/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum ShowDetailsFieldsEndpoint {
    case showDetails(id: Int)
}

//MARK: - Extension
extension ShowDetailsFieldsEndpoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .showDetails:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .showDetails:
            return "http://api-ksa.com/demo/hi5/public/api/player/" + "show_field"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .showDetails(let id):
            return ["field_id": id]
        }
    }
    
    var image: UIImage? {
        switch self {
        case .showDetails:
            return nil
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .showDetails:
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .showDetails:
            return URLEncoding.default
        }
    }
    
    
}
