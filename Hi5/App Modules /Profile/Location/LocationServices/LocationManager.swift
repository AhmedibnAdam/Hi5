//
//  LocationManager.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/26/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import SwiftyJSON

// MARK: - Handle all data requests and responses API / CoreData / Realm etc ...
protocol ILocationManager: class {
    func locationEditProfileFromApi(country: String , countryFlag: String , city: String , cityFlag: String , state: String , stateFlag: String ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: LocationModel.LocationEditProfileResponse?)->Void)
}

class LocationManager: ILocationManager {
    func locationEditProfileFromApi(country: String, countryFlag: String, city: String, cityFlag: String, state: String, stateFlag: String, complition: @escaping (ErrorModel?, Bool,_ data: LocationModel.LocationEditProfileResponse?) -> Void) {
        NetworkService.share.request(endpoint: LocationEndPoint.location(country: country, countryFlag: countryFlag, city: city, cityFlag: cityFlag, state: state, stateFlag: stateFlag), success: { (responseData) in
        let response = responseData
        do {
            let decoder = JSONDecoder()
            let user = try decoder.decode(LocationModel.LocationEditProfileResponse.self, from: response)
            print(user)
            complition(nil,true,user)
            
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
