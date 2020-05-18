//
//  BookingDetailsPresenter.swift
//  Hi5
//
//  Created by Adam on 5/11/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IBookingDetailsPresenter: class {
    func showErrorAlert(title: String, msg: String)
    func showResponse(response: BookingDetailsModel.BookedDetails)

}

class BookingDetailsPresenter: IBookingDetailsPresenter {	
	weak var view: IBookingDetailsViewController?
	
	init(view: IBookingDetailsViewController?) {
		self.view = view
	}
    func showErrorAlert(title: String, msg: String) {
         view?.showAlert(title: title, msg: msg)
     }
     func showResponse(response: BookingDetailsModel.BookedDetails){
         view?.showResponse(response: response)
     }
  
}
