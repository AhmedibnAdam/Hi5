//
//  SignupPhoneVerificationManager.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol ISignupPhoneVerificationManager: class {
    func signupPhoneVerificationFromApi(code: String ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool)->Void)
    func signupResendVerificationCodeFromApi(complition :  @escaping (_ error:ErrorModel? ,_ success: Bool)->Void)
}

class SignupPhoneVerificationManager: ISignupPhoneVerificationManager {
    func signupResendVerificationCodeFromApi( complition: @escaping (ErrorModel?, Bool) -> Void) {
        NetworkService.share.request(endpoint: SignupPhoneVerificationEndpoint.signupResendVerificationCode, success: { (responseData) in
                   let response = responseData
                   do {
                       let decoder = JSONDecoder()
                    let user = try decoder.decode(SignupPhoneVerificationModel.SignupResendVerificationCodeResponse.self, from: response)
                       print(user)
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
    
    func signupPhoneVerificationFromApi(code: String, complition: @escaping (ErrorModel?, Bool) -> Void) {
        NetworkService.share.request(endpoint: SignupPhoneVerificationEndpoint.signupPhoneVerification(code: code), success: { (responseData) in
                   let response = responseData
                   do {
                       let decoder = JSONDecoder()
                    let user = try decoder.decode(SignupPhoneVerificationModel.SignupPhoneVerificationResponse.self, from: response)
                       print(user)
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
