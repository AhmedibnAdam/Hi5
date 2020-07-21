//
//  FilterResultEndPoint.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/1/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import Alamofire

enum FilterResultEndPoint {
    case filterSession(parameter: [String: Any])
    case checkAvalabilty(parameter: [String: Any])
}

//MARK: - Extension
extension FilterResultEndPoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .filterSession:
            return .post
        case .checkAvalabilty:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .filterSession:
            return Constant.base + "player/" + "filter_session"
        case .checkAvalabilty:
            return Constant.base + "player/field/check_availability"
        }
      
    }
    
    var parameter: Parameters? {
        switch self {
        case .filterSession(let parameter):
            return parameter
        case .checkAvalabilty(let parameter):
            return parameter
        }
    }
    
    var image: UIImage? {
        switch self {
        case .filterSession:
            return nil
        case .checkAvalabilty:
                return nil
        }
    }
    
    var header: HTTPHeaders? {
        let defaults = UserDefaults.standard
        let token = defaults.string(forKey: "Token")
//        token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjM1ZTFmMzc2NDQ4YmMzNzQ3YzM2YzlkNTJhNjEwNTVhOWY0NzY3YWZmMTJlZWUzNmFiODQ2YzZkMWZjNjkxZjRhMGM3MzZlMTIyZDAxOTkyIn0.eyJhdWQiOiIxIiwianRpIjoiMzVlMWYzNzY0NDhiYzM3NDdjMzZjOWQ1MmE2MTA1NWE5ZjQ3NjdhZmYxMmVlZTM2YWI4NDZjNmQxZmM2OTFmNGEwYzczNmUxMjJkMDE5OTIiLCJpYXQiOjE1Nzk0MjkxMjcsIm5iZiI6MTU3OTQyOTEyNywiZXhwIjoxNjA1NzgxMTI3LCJzdWIiOiIzMDE0Iiwic2NvcGVzIjpbXX0.TZJcOrrwFjaAL5dNrW2VD_fLLodqZdbxRRGy1Llm3Y1EZJ_sOHQoT9dZCnOxWAc0AoSJdiWKGf4JjWgV1rYWmj8uVcAcwC3QcIc0NU0W46_rtbUeda7urZRjhElKfrOKlnHrSpLtvdq7OWxgZRsKAuqxIOrXjdQmXr0hHRfHi_91qg_JtrZ9Gzc10bDIkD7oDndofYrgC8CG5DLFvv04R9YpCgJpmHXfYT52q6p0lPgmL8BZswHban1bKMtGgUt6JzKXGSFr2VaWeAfq8Uu1HFpmBgJ98TVVIoi3YOL726Pz5J8jh7Sc8hzY-jRA1HKxtn8dRxxyAtRfe7qNzDyYJFSEi9M66enfCvRYPvpUEjMaqUZqf905R4WA-Q4TIekZwo6BLZzJzfZOtjiAQMFuR8DMSyc49L7lQ73jZqM19cFqw5jWf62z6iP95tFCrPRkyPkyJaYbqUW3vw_EOhG5gmMpJzvaPjV8iM1EwiD7pPCBxRS3cS1e27_d7P5StALi2yOqOfSz6WcpStpYWIf8MmFCQV6LR3limwsviIs1pMLcx6cxir3kvTYbjlvwJ63ftMWBGI8ts3aLzYvVSGjkFqcuDWVkjZ7oghE7vaS8PzOtDSyXDxgeZKpC0lj1II7gW2A6YH8sCUeTSmGobWpREOG29SRcKrHmIj3cY6tkRZE"
        return ["Accept": "application/json" , "Authorization": "Bearer \(token!)"]
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .filterSession:
            return JSONEncoding.default
        case .checkAvalabilty:
            return JSONEncoding.default
        }
    }
}
