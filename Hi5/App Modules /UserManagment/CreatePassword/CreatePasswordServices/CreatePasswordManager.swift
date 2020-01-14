//
//  CreatePasswordManager.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol ICreatePasswordManager: class {
	// do someting...
    func createPasswordFromApi(password: String ,confirmPassword: String ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool)->Void)
}

class CreatePasswordManager: ICreatePasswordManager {
    func createPasswordFromApi(password: String, confirmPassword: String, complition: @escaping (ErrorModel?, Bool) -> Void) {
            NetworkService.share.request(endpoint: CreatePasswordEndpoint.CreatePassword(password: password, confirmPassword: confirmPassword), success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(CreatePasswordModel.CreatePasswordResponse.self, from: response)
                print(user)
                
            } catch let error {
                print("error : ", error.localizedDescription  )
                
                do {
                    let decoder = JSONDecoder()
                    let error = try decoder.decode(ErrorModel.self, from: responseData )
                    print(error)
                    complition(error , false)
                } catch let error {
                    print(error)
                    
                }
        }
            
    }, failure: { (error) in
            do {
                let decoder = JSONDecoder()
                let error = try decoder.decode(ErrorModel.self, from: error as! Data )
                print(error)
                complition(error , false)
                
            } catch let error {
                print(error)
                complition(nil , false)
            }
            
        })
    }
}
