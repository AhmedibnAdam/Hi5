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
    func loginFromApi(userName: String ,password: String ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: LoginModel.LoginResponse?)->Void)
}

class LoginManager: ILoginManager {
    // MARK : - do someting...
    func loginFromApi(userName: String ,password: String , complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: LoginModel.LoginResponse?)->Void) {
        NetworkService.share.request(endpoint: LoginEndpoint.login(userName: userName, password: password), success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(LoginModel.LoginResponse.self, from: response)
                print(user)
                let defaults = UserDefaults.standard
                if let token = user.token  {
                    defaults.set(token, forKey: "Token") as? String
                }
                complition(nil,true,user)
                
            } catch let error {
                print("error : ", error.localizedDescription  )
                
                do {
                    let decoder = JSONDecoder()
                    let error = try decoder.decode(ErrorModel.self, from: responseData )
                    print(error)
                    complition(error , false, nil)
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
    
//    func setImage(urlString: String , user: LoginModel.LoginResponse) {
//        if let partnerImg = user.image {
//            guard let url = URL(string: partnerImg) else {return}
//            DispatchQueue.global().async {
//                if let data = try? Data(contentsOf: url){
//                    DispatchQueue.main.async {
//                        UserDefaults.standard.set(data, forKey: "image")
//                    }
//                }
//            }
//        }
//    }
}
