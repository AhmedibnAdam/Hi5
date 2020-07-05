//
//  FieldOwnerDetailsEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/29/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum FieldOwnerDetailsEndPoint {
    case addSuggestField(parameter: [String: Any] , images: [UIImage])
}

//MARK: - Extensions
extension FieldOwnerDetailsEndPoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .addSuggestField:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .addSuggestField:
            return "http://api-ksa.com/demo/hi5/public/api/player/" + "add_suggestion_field"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .addSuggestField(let parameter , let images):
            return parameter
        }
    }
    
    var image: UIImage? {
        switch self {
        case .addSuggestField(let parameter , let images):
            return images.first
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .addSuggestField:
            let defaults = UserDefaults.standard
            let token = defaults.string(forKey: "Token")
            return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .addSuggestField:
            return JSONEncoding.default
        }
    }
}
