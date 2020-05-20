//
//  CommentManager.swift
//  Hi5
//
//  Created by Adam on 5/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol ICommentManager: class {
	func addComment(parameters : [String: Any] , complition: @escaping (ErrorModel?, Bool, CommentModel.CommentResponse?) -> Void)
}

class CommentManager: ICommentManager {
	func addComment(parameters : [String: Any] , complition: @escaping (ErrorModel?, Bool, CommentModel.CommentResponse?) -> Void) {
        
        NetworkService.share.request(endpoint: AddCommenfEndpoint.addComment(parameter: parameters), success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let event = try decoder.decode(CommentModel.CommentResponse.self, from: response)
                print(event)
                complition(nil , true , event)
                
            } catch let error {
                print("error : ", error.localizedDescription  )
                
                do {
                    let decoder = JSONDecoder()
                    let error = try decoder.decode(ErrorModel.self, from: responseData )
                    print(error)
                    complition(error , false , nil)
                } catch let error {
                    print(error)
                    
                }
        }
            
    }, failure: { (error) in
            do {
                let decoder = JSONDecoder()
                let error = try decoder.decode(ErrorModel.self, from: error as! Data )
                print(error)
                complition(error , false , nil)
                
            } catch let error {
                print(error)
                complition(nil , false , nil)
            }
            
        })
    }

}
