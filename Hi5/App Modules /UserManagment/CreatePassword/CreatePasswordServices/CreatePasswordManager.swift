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
    func createPasswordFromApi(parameters:[String: Any]?,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool)->Void)
}

class CreatePasswordManager: ICreatePasswordManager {
    func createPasswordFromApi(parameters:[String: Any]?, complition: @escaping (ErrorModel?, Bool) -> Void) {
            NetworkService.share.request(endpoint: CreatePasswordEndpoint.CreatePassword(parameters: parameters), success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(CreatePasswordModel.CreatePasswordResponse.self, from: response)
                   let defaults = UserDefaults.standard
                             if let token = user.token , let username = user.userName , let fullname = user.fullName {
                                 defaults.set(token, forKey: "Token") as? String
                                 defaults.set(username, forKey: "UserName") as? String
                                 defaults.set(fullname, forKey: "FullName") as? String
                             }
                if let status = user.status {
                    complition(nil , status)
                }
                complition(nil , false)
                
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
