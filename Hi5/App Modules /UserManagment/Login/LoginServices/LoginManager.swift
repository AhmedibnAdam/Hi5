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
    func loginFromApi(userName: String ,password: String ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool)->Void)
}

class LoginManager: ILoginManager {
    // MARK : - do someting...
    func loginFromApi(userName: String ,password: String , complition :  @escaping (_ error:ErrorModel? ,_ success: Bool)->Void) {
        NetworkService.share.request(endpoint: LoginEndpoint.login(userName: userName, password: password), success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(LoginModel.LoginResponse.self, from: response)
                print(user)
                let defaults = UserDefaults.standard
                if let token = user.token , let username = user.userName , let fullname = user.fullName, let userProfileImage = user.image{
                    defaults.set(token, forKey: "Token") as? String
                    defaults.set(username, forKey: "UserName") as? String
                    defaults.set(fullname, forKey: "FullName") as? String
                }
                complition(nil,true)
                
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
