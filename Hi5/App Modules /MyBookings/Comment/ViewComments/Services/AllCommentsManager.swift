//
//  AllCommentsManager.swift
//  Hi5
//
//  Created by Adam on 5/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol IAllCommentsManager: class {
    func getComments(id:Int ,  complition: @escaping (ErrorModel?, Bool, AllCommentsModel.Comments?) -> Void)

}

class AllCommentsManager: IAllCommentsManager {
	
        func getComments(id:Int ,  complition: @escaping (ErrorModel?, Bool, AllCommentsModel.Comments?) -> Void) {
             NetworkService.share.request(endpoint: AllCommentsEndpoint.showComment(fieldId: id), success: { (responseData) in
                 let response = responseData
                 do {
                     let decoder = JSONDecoder()
                     let data = try decoder.decode(AllCommentsModel.Comments.self, from: response)
                     print(data)
                     complition(nil , true , data)

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
