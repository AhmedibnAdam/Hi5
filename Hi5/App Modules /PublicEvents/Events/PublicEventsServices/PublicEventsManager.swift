//
//  PublicEventsManager.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol IPublicEventsManager: class {
	func requestFilteredPublicEventFromApi(parameters : [String: Any] ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: PublicEventsModel.PublicEventResponse?)->Void)
    func requestSearchPublicEventFromApi(parameters : [String: Any] , complition: @escaping (PublicEventsModel.shohrtageProfileResponse?, Bool, PublicEventsModel.PublicEventResponse?) -> Void) 
}

class PublicEventsManager: IPublicEventsManager {
    func requestFilteredPublicEventFromApi(parameters : [String: Any] , complition: @escaping (ErrorModel?, Bool, PublicEventsModel.PublicEventResponse?) -> Void) {
        
        NetworkService.share.request(endpoint: PublicEventsEndpoint.filterPublicEvent(parameter: parameters), success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let event = try decoder.decode(PublicEventsModel.PublicEventResponse.self, from: response)
                print(event)
                complition(nil , true , event)
                
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
    
    
    func requestSearchPublicEventFromApi(parameters : [String: Any] , complition: @escaping (PublicEventsModel.shohrtageProfileResponse?, Bool, PublicEventsModel.PublicEventResponse?) -> Void) {
        
        NetworkService.share.request(endpoint: PublicEventsEndpoint.searchPublicEvent(parameter: parameters), success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let event = try decoder.decode(PublicEventsModel.PublicEventResponse.self, from: response)
                print(event)
                complition(nil , true , event)
                
            } catch let error {
                print("error : ", error.localizedDescription  )
                
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(PublicEventsModel.shohrtageProfileResponse.self, from: responseData )
                    print(error)
                    complition(data , false , nil)
                } catch let error {
                    print(error)
                    
                }
        }
            
    }, failure: { (error) in
            do {
                let decoder = JSONDecoder()
                let error = try decoder.decode(PublicEventsModel.shohrtageProfileResponse.self, from: error as! Data )
                print(error)
                complition(error , false , nil)
                
            } catch let error {
                print(error)
                complition(nil , false , nil)
            }
            
        })
    }

    
}
