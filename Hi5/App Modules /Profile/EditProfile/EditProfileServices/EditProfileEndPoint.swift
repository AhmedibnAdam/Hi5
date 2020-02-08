//
//  EditProfileEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/5/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum EditProfileEndPoint {
    case editProfile( editProfile: [String: Any]?)
}
//MARK: - Extensions
extension EditProfileEndPoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .editProfile:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .editProfile:
            return "http://api-ksa.com/demo/hi5/public/api/player/" + "edit_profile"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .editProfile:
            return ["":""]
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .editProfile:
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .editProfile:
            return JSONEncoding.default
        }
    }
}
