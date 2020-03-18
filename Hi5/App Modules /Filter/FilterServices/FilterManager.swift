//
//  FilterManager.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol IFilterManager: class {
    func suggestionFieldFromApi(complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: FilterModel.SuggestionFieldResponse?)->Void)
}

class FilterManager: IFilterManager {
    func suggestionFieldFromApi(complition: @escaping (ErrorModel?, Bool, FilterModel.SuggestionFieldResponse?) -> Void) {
        NetworkService.share.request(endpoint: FilterEndPoint.suggestionField, success: { (responseData) in
               let response = responseData
               do {
                   let decoder = JSONDecoder()
                let user = try decoder.decode(FilterModel.SuggestionFieldResponse.self, from: response)
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
