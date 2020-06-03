//
//  ProfileManager.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import SwiftyJSON

// MARK: - Handle all data requests and responses API / CoreData / Realm etc ...

protocol IProfileManager: class {
    func showProfileFromApi(id:Int ,lat: Double,long: Double, complition :  @escaping (_ error:ErrorModel? ,_ success: Bool , _ data: ProfileModel.PartnerProfile?)->Void)
       func showUserProfileFromApi( complition: @escaping (ErrorModel?, Bool , ProfileModel.ShowProfileResponse?) -> Void)
}

class ProfileManager: IProfileManager {
    func showProfileFromApi(id:Int ,lat: Double,long: Double, complition: @escaping (ErrorModel?, Bool , ProfileModel.PartnerProfile?) -> Void) {
        NetworkService.share.request(endpoint: ProfileEndpoint.ShowProfile(id: id, lat: lat, long: long), success: { (responseData) in
        let response = responseData
        do {
            let decoder = JSONDecoder()
            let user = try decoder.decode(ProfileModel.PartnerProfile.self, from: response)
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
    func showUserProfileFromApi( complition: @escaping (ErrorModel?, Bool , ProfileModel.ShowProfileResponse?) -> Void) {
            NetworkService.share.request(endpoint: ProfileEndpoint.showUserProfile, success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(ProfileModel.ShowProfileResponse.self, from: response)
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
