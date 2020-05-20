//
//  AddCommenfEndpoint.swift
//  Hi5
//
//  Created by Adam on 5/20/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Alamofire

enum AddCommenfEndpoint {
    /*
     Add Endpoint
     case sample
     case sample(parameter: [String: Any])
    */
    case addComment(parameter: [String: Any])
}

extension AddCommenfEndpoint: IEndpoint {
    var image: UIImage? {
        return nil
    }
    
    var method: HTTPMethod {
        /*
        Do like this:

        switch self {
        case .sample:
            return .get
        }
        */
        return .post
    }
    
    var path: String {
    

        switch self {
        case .addComment(let parameter):
            let id = parameter["field_id"]
            return "http://api-ksa.com/demo/hi5/public/api/player/session/" + "\(id!)" + "/add_comment"
        }
       
        
       
    }
    
    var parameter: Parameters? {
     

        switch self {
        case .addComment(let parameters):
            return parameters
        }
       
    
    }
    
    var header: HTTPHeaders? {
        let defaults = UserDefaults.standard
                            let token = defaults.string(forKey: "Token")
                            
                    let headers = ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
                  return headers
    }
    
    var encoding: ParameterEncoding {        
        
        return JSONEncoding.default
    }
}
