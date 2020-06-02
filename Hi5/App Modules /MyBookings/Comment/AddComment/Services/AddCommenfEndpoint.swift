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
    case lastComment( parameter: [String: Any])
}

extension AddCommenfEndpoint: IEndpoint {
    var image: UIImage? {
        return nil
    }
    
    var method: HTTPMethod {
      

        switch self {
        case .lastComment:
            return .get
        case .addComment:
            return .post
        }
  
    }
    
    var path: String {
    

        switch self {
        case .addComment(let parameter):
            let id = parameter["session_id"]
            return "http://api-ksa.com/demo/hi5/public/api/player/session/" + "\(id!)" + "/add_comment"
        case .lastComment(let param):
            let sesssionid = param["session_id"]
            let fieldId = param["field_id"]
            return "http://api-ksa.com/demo/hi5/public/api/player/field/\(fieldId!)/session/\(sesssionid!)/comment"
        }
       
        
       
    }
    
    var parameter: Parameters? {
     

        switch self {
        case .addComment(var parameters):
            parameters.removeValue(forKey: "session_id")
            return parameters
        case .lastComment:
            return nil
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
