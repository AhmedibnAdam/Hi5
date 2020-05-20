//
//  FilterBublicEventManager.swift
//  Hi5
//
//  Created by Adam on 5/19/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol IFilterBublicEventManager: class {
	func filterEventFromApi(complition: @escaping (ErrorModel?, Bool, FilterModel.SuggestionFieldResponse?) -> Void)
}

class FilterBublicEventManager: IFilterBublicEventManager {
	
    func filterEventFromApi(complition: @escaping (ErrorModel?, Bool, FilterModel.SuggestionFieldResponse?) -> Void) {
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
