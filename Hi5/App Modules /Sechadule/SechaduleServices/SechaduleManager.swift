//
//  SechaduleManager.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/14/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol ISechaduleManager: class {
	    func getUpCommingSechaduleFromApi(complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: SechaduleModel.SechaduleSessions?)->Void)
    func getPastSechaduleFromApi(complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: SechaduleModel.PastSechaduleResponse?)->Void)
    
    func getCancelSechaduleFromApi(complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: SechaduleModel.CanceledSechaduleResponse?)->Void)
}

class SechaduleManager: ISechaduleManager {
    func getUpCommingSechaduleFromApi(complition: @escaping (ErrorModel?, Bool, SechaduleModel.SechaduleSessions?) -> Void) {
            NetworkService.share.request(endpoint: MyBookingsEndpoint.upCommingBookings, success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let myBooking = try decoder.decode(SechaduleModel.SechaduleSessions.self, from: response)
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
    
    func getPastSechaduleFromApi(complition: @escaping (ErrorModel?, Bool, SechaduleModel.PastSechaduleResponse?) -> Void) {
            NetworkService.share.request(endpoint: MyBookingsEndpoint.pastBookings, success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let myBooking = try decoder.decode(SechaduleModel.PastSechaduleResponse.self, from: response)
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
    
    func getCancelSechaduleFromApi(complition: @escaping (ErrorModel?, Bool, SechaduleModel.CanceledSechaduleResponse?) -> Void) {
            NetworkService.share.request(endpoint: MyBookingsEndpoint.cancelBookings, success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let myBooking = try decoder.decode(SechaduleModel.CanceledSechaduleResponse.self, from: response)
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
    
	// do someting...
}
