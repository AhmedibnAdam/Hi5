//
//  FilterResultManager.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/26/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol IFilterResultManager: class {
    func filterSessionFromApi(parameter: [String: Any] , complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: FilterResultModel.FilterSessionResponse?)->Void)
    
    func checkAvalablityFromApi(parameter: [String: Any] , complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: FilterResultModel.FilterSessionResponse?)->Void)
}

class FilterResultManager: IFilterResultManager {

    
    func filterSessionFromApi(parameter: [String : Any] , complition: @escaping (ErrorModel?, Bool, FilterResultModel.FilterSessionResponse?) -> Void) {
    NetworkService.share.request(endpoint: FilterResultEndPoint.filterSession(parameter: parameter), success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(FilterResultModel.FilterSessionResponse.self, from: response)
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
    
    func checkAvalablityFromApi(parameter: [String : Any], complition: @escaping (ErrorModel?, Bool, FilterResultModel.FilterSessionResponse?) -> Void) {
    NetworkService.share.request(endpoint: FilterResultEndPoint.checkAvalabilty(parameter: parameter), success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(FilterResultModel.FilterSessionResponse.self, from: response)
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
