//
//  AllCommentsEndpoint.swift
//  Hi5
//
//  Created by Adam on 5/18/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Alamofire

enum AllCommentsEndpoint {
    /*
     Add Endpoint
     case sample
     case sample(parameter: [String: Any])
    */
    case showComment(fieldId: Int)
}

extension AllCommentsEndpoint: IEndpoint {
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
        return .get
    }
    
    var path: String {
        
        
        switch self {
        case .showComment (let id):
            return "http://api-ksa.com/demo/hi5/public/api/player/field/" + "\(id)" + "/show_comments"
            
        }
        
    }
    
    var parameter: Parameters? {
        /*
        Do like this:

        switch self {
        case .sample(let model):
            return model.parameter()
        }
        */
        return nil
    }
    
    var header: HTTPHeaders? {
             let defaults = UserDefaults.standard
                    let token = defaults.string(forKey: "Token")
                    return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
    }
    
    var encoding: ParameterEncoding {        
        /*
        Do like this:
        
        return URLEncoding.queryString for URL Query
        
        switch self {
        case .sample:
            return JSONEncoding.default
        }
        */
        return JSONEncoding.default
    }
}
