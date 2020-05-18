//
//  BookingDetailsEndpoint.swift
//  Hi5
//
//  Created by Adam on 5/14/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Alamofire

enum BookingDetailsEndpoint {
    /*
     Add Endpoint
     case sample
     case sample(parameter: [String: Any])
    */
    case getBookingDetails(id: Int)
}

extension BookingDetailsEndpoint: IEndpoint {
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
        case .getBookingDetails(let id):
            return "http://api-ksa.com/demo/hi5/public/api/player/booked_session/" + "\(id)"
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
                return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]    }
    
    var encoding: ParameterEncoding {        
    
        return JSONEncoding.default
    }
}
