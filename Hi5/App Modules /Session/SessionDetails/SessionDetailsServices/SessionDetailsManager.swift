//
//  SessionDetailsManager.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/5/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol ISessionDetailsManager: class {
	func sessionDetailsFromApi(fieldId: Int , payment: String , complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: SessionDetailsModel.SessionDetailsResponse?)->Void)
    func fieldContactsFromApi(id: Int , complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: SessionDetailsModel.FieldContactsResponse?)->Void)
}

class SessionDetailsManager: ISessionDetailsManager {
    func fieldContactsFromApi(id: Int, complition: @escaping (ErrorModel?, Bool, SessionDetailsModel.FieldContactsResponse?) -> Void) {
        NetworkService.share.request(endpoint: SessionDetailsEndPoint.getFieldContacts(id: id), success: { (responseData) in
                let response = responseData
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(SessionDetailsModel.FieldContactsResponse.self, from: response)
                    print(user)
                    complition(nil , true , user)
                    
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
    
    func sessionDetailsFromApi(fieldId: Int, payment: String, complition: @escaping (ErrorModel?, Bool, SessionDetailsModel.SessionDetailsResponse?) -> Void) {
        NetworkService.share.request(endpoint: SessionDetailsEndPoint.getSessionDetails(fieldId: fieldId, payment: payment), success: { (responseData) in
                let response = responseData
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(SessionDetailsModel.SessionDetailsResponse.self, from: response)
                    print(user)
                    complition(nil , true , user)
                    
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
