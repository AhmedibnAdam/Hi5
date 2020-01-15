//
//  PhoneVerificationManager.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol IPhoneVerificationManager: class {
    func PhoneVerificationFromApi(code: String ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool)->Void)
    func ResendVerificationCodeFromApi(complition :  @escaping (_ error:ErrorModel? ,_ success: Bool)->Void)
}

class PhoneVerificationManager: IPhoneVerificationManager {
    func ResendVerificationCodeFromApi( complition: @escaping (ErrorModel?, Bool) -> Void) {
        NetworkService.share.request(endpoint: PhoneVerificationEndpoint.ResendVerificationCode, success: { (responseData) in
                   let response = responseData
                   do {
                       let decoder = JSONDecoder()
                    let user = try decoder.decode(PhoneVerificationModel.ResendVerificationCodeResponse.self, from: response)
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
    
    func PhoneVerificationFromApi(code: String, complition: @escaping (ErrorModel?, Bool) -> Void) {
        NetworkService.share.request(endpoint: PhoneVerificationEndpoint.PhoneVerification(code: code), success: { (responseData) in
                   let response = responseData
                   do {
                       let decoder = JSONDecoder()
                    let user = try decoder.decode(PhoneVerificationModel.PhoneVerificationResponse.self, from: response)
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
