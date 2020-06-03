//
//  ProfileEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/3/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum ProfileEndpoint {
    case ShowProfile(id: Int , lat: Double ,long: Double)
    case showUserProfile
}
//MARK:- Extension
extension ProfileEndpoint: IEndpoint {
    var image: UIImage? {
        return nil
    }
    
    var method: HTTPMethod {
        switch self {
        case .ShowProfile:
            return .get
        case .showUserProfile:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .ShowProfile(let id , let lat , let long):
            return "http://api-ksa.com/demo/hi5/public/api/partner/" + "\(id)" + "/show?" + "longitude=" + "\(long)&latitude=" + "\(lat)"
        case .showUserProfile:
            return "http://api-ksa.com/demo/hi5/public/api/player/show_profile"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .ShowProfile:
            return nil
        case .showUserProfile:
            return nil
        }
    }
    
    var header: HTTPHeaders? {
//       switch self {
//           case .ShowProfile:
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
//        }
    }
    
    var encoding: ParameterEncoding {
//        switch self {
//        case .ShowProfile:
            return URLEncoding.default
//        }
    }
    
}
