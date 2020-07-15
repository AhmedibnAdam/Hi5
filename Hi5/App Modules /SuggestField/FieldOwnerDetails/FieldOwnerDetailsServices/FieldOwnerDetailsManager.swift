//
//  FieldOwnerDetailsManager.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import SwiftyJSON

protocol IFieldOwnerDetailsManager: class {
    func addSuggestFieldFromApi(parameter: [String: Any] , images: [UIImage] , complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: FieldOwnerDetailsModel.AddSuggestFieldResponse?)->Void)
}

class FieldOwnerDetailsManager: IFieldOwnerDetailsManager {
    func addSuggestFieldFromApi(parameter: [String : Any], images: [UIImage] ,  complition: @escaping (ErrorModel?, Bool, FieldOwnerDetailsModel.AddSuggestFieldResponse?) -> Void) {
        NetworkService.share.request(endpoint: FieldOwnerDetailsEndPoint.addSuggestField(parameter: parameter, images: images) , success: { (responseData) in
                let response = responseData
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(FieldOwnerDetailsModel.AddSuggestFieldResponse.self, from: response)
                    print(user)
                    complition(nil,true , user)
                    
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