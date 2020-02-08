//
//  EditProfileManager.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/20/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import SwiftyJSON

// MARK: - Handle all data requests and responses API / CoreData / Realm etc ...

protocol IEditProfileManager: class {
    func editProfileFromApi(editProfile: [String: Any]? ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool)->Void)
}

class EditProfileManager: IEditProfileManager {
    func editProfileFromApi(editProfile: [String : Any]?, complition: @escaping (ErrorModel?, Bool) -> Void) {
        NetworkService.share.request(endpoint: EditProfileEndPoint.editProfile(editProfile: editProfile), success: { (responseData) in
        let response = responseData
        do {
            let decoder = JSONDecoder()
            let user = try decoder.decode(EditProfileModel.EditProfileResponse.self, from: response)
            print(user)
            complition(nil,true)
            
        } catch let error {
            print("error : ", error.localizedDescription  )
            
            do {
                let decoder = JSONDecoder()
                let error = try decoder.decode(ErrorModel.self, from: responseData )
                print(error)
                complition(error , false)
            } catch let error {
                print(error)
                
            }
    }
        
}, failure: { (error) in
        do {
            let decoder = JSONDecoder()
            let error = try decoder.decode(ErrorModel.self, from: error as! Data )
            print(error)
            complition(error , false)
            
        } catch let error {
            print(error)
            complition(nil , false)
        }
        
      })
    }
}
