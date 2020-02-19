//
//  FieldsManager.swift
//  Hi5
//
//  Created by Adam on 12/26/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import SwiftyJSON

// MARK: - Handle all data requests and responses API / CoreData / Realm etc ...

protocol IFieldsManager: class {
    func nearByFromApi(lon: Double ,lat: Double ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: FieldsModel.NearByfieldsResponse?)->Void)
    func favouriteFromApi(complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: FieldsModel.NearByfieldsResponse?)->Void)
    func memberOfFromApi(complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: FieldsModel.NearByfieldsResponse?)->Void)
}

class FieldsManager: IFieldsManager {
    func nearByFromApi(lon: Double, lat: Double, complition: @escaping (ErrorModel?, Bool, FieldsModel.NearByfieldsResponse?) -> Void) {
        NetworkService.share.request(endpoint: FieldsEndpoint.nearBy(lon: lon, lat: lat), success: { (responseData) in
                let response = responseData
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(FieldsModel.NearByfieldsResponse.self, from: response)
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
    
    func favouriteFromApi(complition: @escaping (ErrorModel?, Bool, FieldsModel.NearByfieldsResponse?) -> Void) {
            NetworkService.share.request(endpoint: FieldsEndpoint.favourite, success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(FieldsModel.NearByfieldsResponse.self, from: response)
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
    
    func memberOfFromApi(complition: @escaping (ErrorModel?, Bool, FieldsModel.NearByfieldsResponse?) -> Void) {
            NetworkService.share.request(endpoint: FieldsEndpoint.memberOf, success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(FieldsModel.NearByfieldsResponse.self, from: response)
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
