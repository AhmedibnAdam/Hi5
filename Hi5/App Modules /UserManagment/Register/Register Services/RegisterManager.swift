//
//  RegisterManager.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol IRegisterManager: class {
	// MARK : - do someting...
    func signupFromApi(fullName: String ,phoneNumber: String ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool)->Void)
}
class RegisterManager: IRegisterManager {
	// MARK : - do someting...
    func signupFromApi(fullName: String, phoneNumber: String, complition: @escaping (ErrorModel?, Bool) -> Void) {
        NetworkService.share.request(endpoint: RegisterEndpoint.signup(fullName: fullName, phoneNumber: phoneNumber), success: { (responseData) in
                   let response = responseData
                   do {
                       let decoder = JSONDecoder()
                       let user = try decoder.decode(RegisterModel.SignupResponse.self, from: response)
                       print(user) // the value here is nil
                    guard let token = user.token , let username = user.userName else {return}
                       let defaults = UserDefaults.standard
                       defaults.set(token, forKey: "Token") as? String
                       defaults.set(username, forKey: "UserName") as? String
                       complition(nil , true)
                       
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

