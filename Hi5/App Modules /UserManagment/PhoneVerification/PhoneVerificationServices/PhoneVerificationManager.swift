//
//  PhoneVerificationManager.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import Foundation

protocol IPhoneVerificationManager: class {
    func PhoneVerificationFromApi(code: String ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool)->Void)
    func ResendVerificationCodeFromApi(complition :  @escaping (_ error:ErrorModel? ,_ success: Bool)->Void)
    func sendVerificationCodeFromApi(complition :  @escaping (_ error:ErrorModel? ,_ success: Bool)->Void)
    func phone(phone: String, complition: @escaping (ErrorModel?, Bool) -> Void)
}

class PhoneVerificationManager: IPhoneVerificationManager {

   func sendVerificationCodeFromApi( complition: @escaping (ErrorModel?, Bool) -> Void) {
       NetworkService.share.request(endpoint: PhoneVerificationEndpoint.sendVerificationCode, success: { (responseData) in
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
    
    func phone(phone: String, complition: @escaping (ErrorModel?, Bool) -> Void) {
        NetworkService.share.request(endpoint: PhoneVerificationEndpoint.phone(phone: phone), success: { (responseData) in
                   let response = responseData
                   do {
                       let decoder = JSONDecoder()
                    let user = try decoder.decode(PhoneVerificationModel.PhoneVerificationResponse.self, from: response)
                       print(user)
                    if let status = user.status {
                          complition(nil , status)
                    }
                    else{
                         complition(nil , false)
                    }
                      
                       
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
                    if let status = user.status {
                          complition(nil , status)
                    }
                    else{
                         complition(nil , false)
                    }
                      
                       
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
