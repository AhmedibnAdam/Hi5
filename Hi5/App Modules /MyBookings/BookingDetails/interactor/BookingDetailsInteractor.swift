//
//  BookingDetailsInteractor.swift
//  Hi5
//
//  Created by Adam on 5/11/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IBookingDetailsInteractor: class {
	var parameters: [String: Any]? { get set }
    func bookedDetails(view : UIViewController , fieldId: Int )
    func cancelBooking( fieldId: String )
}

class BookingDetailsInteractor: IBookingDetailsInteractor {
    var presenter: IBookingDetailsPresenter?
    var manager: IBookingDetailsManager?
    var parameters: [String: Any]?

    init(presenter: IBookingDetailsPresenter, manager: IBookingDetailsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func bookedDetails(view: UIViewController, fieldId: Int) {
        manager?.bookedDetailsFromApi(fieldId: fieldId, complition: { (error, success, response) in
            if (success == true) {
                guard let response = response else {return}
                if (response.status == true){
                    self.presenter?.showResponse(response: response)
                } else {
                    self.presenter?.showErrorAlert(title: "Error", msg: "SomeThing Wrong")
                }
            } else {
                self.presenter?.showErrorAlert(title: "Error", msg: "SomeThing Wrong")
            }
        })
    }
    func cancelBooking( fieldId: String ){
        manager?.cancelBooking(id: fieldId, parameter: parameters! , complition: { (error, success, response) in
            if response == nil {
                self.presenter?.showErrorAlert(title: "Alert", msg: "your request already booked before , or something goes wrong.")
            }
            else{
             self.presenter?.showErrorAlert(title: "Alert", msg: response?.msg ?? "Error")
          //  self.presenter?.showDetailsResponse(response: response)
            }
        })
    }

}
