//
//  SessionDetailsEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/6/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum SessionDetailsEndPoint {
    case getSessionDetails(fieldId: Int , payment: String)
    case getFieldContacts(id: Int)
}

//MARK: - Extension
extension SessionDetailsEndPoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .getSessionDetails:
            return .post
        case .getFieldContacts:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getSessionDetails(let fieldId, let payment):
            return Constant.base + "player/" + "session/\(fieldId)/details"
        case .getFieldContacts(let id):
            return Constant.base + "player/" + "field/\(id)/contacts"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .getSessionDetails(let fieldId, let payment):
            return ["payment_method": payment]
        case .getFieldContacts:
            return ["":""]
        }
    }
    
    var image: UIImage? {
        switch self {
        case .getSessionDetails:
            return nil
        case .getFieldContacts:
            return nil
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .getSessionDetails:
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        case .getFieldContacts:
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getSessionDetails:
            return JSONEncoding.default
        case .getFieldContacts:
            return URLEncoding.default
        }
    }
}
