//
//  GenderEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/4/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum GenderEndPoint {
    case gender(gender: String)
}
//MARK:- Extensions

extension GenderEndPoint: IEndpoint {
    var image: UIImage? {
        return nil
    }
    
    var method: HTTPMethod {
        switch self {
        case .gender:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .gender:
            return Constant.base + "player/" + "edit_profile"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .gender(let gender):
            return ["gender": gender]
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .gender:
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .gender:
            return JSONEncoding.default
        }
    }
    
}
