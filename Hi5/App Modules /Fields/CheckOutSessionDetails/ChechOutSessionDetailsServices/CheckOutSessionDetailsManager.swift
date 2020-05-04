//
//  CheckOutSessionDetailsManager.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol ICheckOutSessionDetailsManager: class {
    
    func joinApi(id: String, complition: @escaping (ErrorModel?, Bool, CheckOutSessionDetailsModel.PublicEventDetailsJoin?) -> Void)
}

class CheckOutSessionDetailsManager: ICheckOutSessionDetailsManager {
    
    func joinApi(id: String, complition: @escaping (ErrorModel?, Bool, CheckOutSessionDetailsModel.PublicEventDetailsJoin?) -> Void) {
        NetworkService.share.request(endpoint: CheckOutSessionDetailsEndpoint.join(event_id: id), success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(CheckOutSessionDetailsModel.PublicEventDetailsJoin.self, from: response)
                print(data)
                complition(nil , true , data)

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
    }}
