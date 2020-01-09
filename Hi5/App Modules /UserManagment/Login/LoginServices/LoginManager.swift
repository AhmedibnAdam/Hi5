//
//  LoginManager.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import SwiftyJSON

// MARK: - Handle all data requests and responses API / CoreData / Realm etc ...

protocol ILoginManager: class {
    // MARK : - do someting...
    func loginFromApi(parameters: [String: Any] ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool ,_ data:Data?)->Void)
}

class LoginManager: ILoginManager {
    // MARK : - do someting...
    func loginFromApi(parameters: [String: Any] , complition :  @escaping (_ error:ErrorModel? ,_ success: Bool ,_ data:Data?)->Void) {
        NetworkService.share.request(endpoint: LoginEndpoint.login(parameter: parameters), success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(LoginModel.Response.self, from: response)
                print(user)
                
            } catch let error {
                print("error : ", error.localizedDescription  )
                
                do {
                    let decoder = JSONDecoder()
                    let error = try decoder.decode(ErrorModel.self, from: responseData )
                    print(error)
                    complition(error , false , responseData )
                } catch let error {
                    print(error)
                    
                }
  
        }
            
    }, failure: { (error) in
            do {
                let decoder = JSONDecoder()
                let error = try decoder.decode(ErrorModel.self, from: error as! Data )
                print(error)
                complition(error , false , nil )
                
            } catch let error {
                print(error)
                complition(nil , false , nil )
            }
            
        })
    }
}
