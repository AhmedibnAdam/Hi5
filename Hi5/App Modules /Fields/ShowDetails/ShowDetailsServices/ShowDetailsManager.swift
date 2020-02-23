//
//  ShowDetailsManager.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/22/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol IShowDetailsManager: class {
    func showDetailsFromApi(id: Int ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: ShowDetailsModel.ShowDetailsResponse?)->Void)
}

class ShowDetailsManager: IShowDetailsManager {
    func showDetailsFromApi(id: Int, complition: @escaping (ErrorModel?, Bool, ShowDetailsModel.ShowDetailsResponse?) -> Void) {
        NetworkService.share.request(endpoint: ShowDetailsFieldsEndpoint.showDetails(id: id), success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(ShowDetailsModel.ShowDetailsResponse.self, from: response)
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
