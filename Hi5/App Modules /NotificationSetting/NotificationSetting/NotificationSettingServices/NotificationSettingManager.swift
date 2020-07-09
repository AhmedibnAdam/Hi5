//
//  NotificationSettingManager.swift
//  Hi5
//
//  Created by Adam on 12/31/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol INotificationSettingManager: class {
    func getNotifiactionsFromApi(page: Int , complition: @escaping (ErrorModel?, Bool, NotificationSettingModel.NotificationsModel?) -> Void)
    
}

class NotificationSettingManager: INotificationSettingManager {
    func getNotifiactionsFromApi(page: Int , complition: @escaping (ErrorModel?, Bool, NotificationSettingModel.NotificationsModel?) -> Void){
        NetworkService.share.request(endpoint: NotificationsEndpoint.notifications(page: page), success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let event = try decoder.decode(NotificationSettingModel.NotificationsModel.self, from: response)
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
}
