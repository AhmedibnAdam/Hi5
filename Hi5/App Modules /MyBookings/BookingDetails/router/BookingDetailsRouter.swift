//
//  BookingDetailsRouter.swift
//  Hi5
//
//  Created by Adam on 5/11/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IBookingDetailsRouter: class {
    func navigateToComment(params: [String: Any])
     func navigateToReceipt()
}

class BookingDetailsRouter: IBookingDetailsRouter {	
	weak var view: BookingDetailsViewController?
	
	init(view: BookingDetailsViewController?) {
		self.view = view
	}
    func navigateToComment(params: [String: Any]){
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.comment(parameters: params), completion: nil)
    }
    func navigateToReceipt(){
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.receipt, completion: nil)
    }
}
