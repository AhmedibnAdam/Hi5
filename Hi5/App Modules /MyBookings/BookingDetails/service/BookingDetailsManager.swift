//
//  BookingDetailsManager.swift
//  Hi5
//
//  Created by Adam on 5/11/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol IBookingDetailsManager: class {
	    func bookedDetailsFromApi(fieldId: Int  , complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: BookingDetailsModel.BookedDetails?)->Void)
}

class BookingDetailsManager: IBookingDetailsManager {
	
    func bookedDetailsFromApi(fieldId: Int, complition: @escaping (ErrorModel?, Bool, BookingDetailsModel.BookedDetails?) -> Void) {
        NetworkService.share.request(endpoint: BookingDetailsEndpoint.getBookingDetails(id: fieldId), success: { (responseData) in
                let response = responseData
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(BookingDetailsModel.BookedDetails.self, from: response)
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
