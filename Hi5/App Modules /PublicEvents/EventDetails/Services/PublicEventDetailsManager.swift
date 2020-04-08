//
//  PublicEventDetailsManager.swift
//  Hi5
//
//  Created by Adam on 4/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol IPublicEventDetailsManager: class {
	func showDetailsFromApi(id: String ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: PublicEventDetailsModel.PublicEventDetails?)->Void)
}

class PublicEventDetailsManager: IPublicEventDetailsManager {
    func showDetailsFromApi(id: String, complition: @escaping (ErrorModel?, Bool, PublicEventDetailsModel.PublicEventDetails?) -> Void) {
        NetworkService.share.request(endpoint: PublicEventDetailsEndpoint.public_event(id: id), success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(PublicEventDetailsModel.PublicEventDetails.self, from: response)
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
    }
    
}
