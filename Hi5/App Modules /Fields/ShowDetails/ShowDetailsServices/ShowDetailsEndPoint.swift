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
    case showDetails(id: String)
    case requestMemberShip(id: Int)
    case cancelRequestMemberShip(id: Int)
}

//MARK: - Extension
extension ShowDetailsFieldsEndpoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .showDetails:
            return .get
        case .requestMemberShip:
            return .post
        case .cancelRequestMemberShip:
            return .delete
        }
    }
    
    var path: String {
        switch self {
        case .showDetails:
            return "http://api-ksa.com/demo/hi5/public/api/player/" + "show_field"
        case .requestMemberShip:
            return "http://api-ksa.com/demo/hi5/public/api/player/" + "add_member_ship"
        case .cancelRequestMemberShip:
            return "http://api-ksa.com/demo/hi5/public/api/player/" + "remove_member_ship"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .showDetails(let id):
            return ["field_id": id]
        case .requestMemberShip(let id):
            return ["field_id": id]
        case .cancelRequestMemberShip(let id):
            return ["field_id": id]
        }
    }
    
    var image: UIImage? {
        switch self {
        case .showDetails:
            return nil
        case .requestMemberShip:
            return nil
        case .cancelRequestMemberShip:
            return nil
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .showDetails:
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        case .requestMemberShip:
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        case .cancelRequestMemberShip:
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .showDetails:
            return URLEncoding.default
        case .requestMemberShip:
            return JSONEncoding.default
        case .cancelRequestMemberShip:
            return URLEncoding.default
        }
    }
    
    
}
