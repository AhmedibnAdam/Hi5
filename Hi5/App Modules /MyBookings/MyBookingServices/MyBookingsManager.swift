//
//  MyBookingsManager.swift
//  Hi5
//
//  Created by Adam on 3/18/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol IMyBookingsManager: class {
	   func getUpCommingBookingsFromApi(complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: MyBookingsModel.MyBookingSessions?)->Void)
       func getPastBookingsFromApi(complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: MyBookingsModel.MyBookingSessions?)->Void)

    func getUpCancelBookingsFromApi(complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: MyBookingsModel.MyBookingSessions?)->Void)

}

class MyBookingsManager: IMyBookingsManager {
   
    
    
    func getUpCommingBookingsFromApi(complition: @escaping (ErrorModel?, Bool, MyBookingsModel.MyBookingSessions?) -> Void) {
            NetworkService.share.request(endpoint: MyBookingsEndpoint.pastBookings, success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let myBooking = try decoder.decode(MyBookingsModel.MyBookingSessions.self, from: response)
                print(myBooking)
                complition(nil , true , myBooking)
                
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
    
    func getPastBookingsFromApi(complition: @escaping (ErrorModel?, Bool, MyBookingsModel.MyBookingSessions?) -> Void) {
            NetworkService.share.request(endpoint: MyBookingsEndpoint.pastBookings, success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let myBooking = try decoder.decode(MyBookingsModel.MyBookingSessions.self, from: response)
                print(myBooking)
                complition(nil , true , myBooking)
                
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
       
       func getUpCancelBookingsFromApi(complition: @escaping (ErrorModel?, Bool, MyBookingsModel.MyBookingSessions?) -> Void) {
           
       }
       
	
}
