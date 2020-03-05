//
//  SessionResultManager.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/4/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol ISessionResultManager: class {
    func checkAvailabilityFromApi(fieldId: Int , date: String , complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: SessionResultModel.SessionResultResponse?)->Void)
}

class SessionResultManager: ISessionResultManager {
    func checkAvailabilityFromApi(fieldId: Int, date: String, complition: @escaping (ErrorModel?, Bool, SessionResultModel.SessionResultResponse?) -> Void) {
        NetworkService.share.request(endpoint: SessionResultEndPoint.checkAvailability(fieldId: fieldId, date: date), success: { (responseData) in
                let response = responseData
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(SessionResultModel.SessionResultResponse.self, from: response)
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
