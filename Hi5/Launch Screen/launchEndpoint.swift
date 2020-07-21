//
//  launchEndpoint.swift
//  Hi5
//
//  Created by Adam on 7/8/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import Foundation
import Alamofire

enum launchEndpoint {
    case deviceToken(parameters: [String: Any])
}

extension launchEndpoint: IEndpoint {
    var image: UIImage? {
        return nil
    }
    
    var method: HTTPMethod {
      
        return .post
    }
    
    var path: String {
        return Constant.base + "player/update_device_token"
    }
    
    var parameter: Parameters? {
        
        
        switch self {
        case .deviceToken(let parameters):
            return parameters
        }
        
    }
    
    var header: HTTPHeaders? {
        let defaults = UserDefaults.standard
        let token = defaults.string(forKey: "Token")
        return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
    }
    
    var encoding: ParameterEncoding {        
        
        return JSONEncoding.default
    }
}
