//
//  MyBookingsEndpoint.swift
//  Hi5
//
//  Created by Adam on 3/19/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Alamofire

enum MyBookingsEndpoint {
   
     case pastBookings
     case upCommingBookings
     case cancelBookings
   
}

extension MyBookingsEndpoint: IEndpoint {
    var image: UIImage? {
        return nil
    }
    
    var method: HTTPMethod {
        
        switch self {
        case .pastBookings:
            return .get
        case .upCommingBookings:
            return .get
        case .cancelBookings:
            return .get
        }
       
    }
    
    var path: String {
          switch self {
             case .pastBookings:
                 return "http://api-ksa.com/demo/hi5/public/api/player/sessions/my_booking?status=past"
             case .upCommingBookings:
                 return "http://api-ksa.com/demo/hi5/public/api/player/sessions/my_booking?status=upcoming"
             case .cancelBookings:
                 return "http://api-ksa.com/demo/hi5/public/api/player/sessions/my_booking?status=canceled"
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
        /*
         Do like this:
         
         switch self {
         case .sample:
         return ["key": Any]
         }
         */
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
