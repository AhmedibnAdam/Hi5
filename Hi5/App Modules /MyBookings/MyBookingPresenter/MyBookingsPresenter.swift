//
//  MyBookingsPresenter.swift
//  Hi5
//
//  Created by Adam on 3/18/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyBookingsPresenter: class {
	func showErrorAlert(title: String, msg: String)
    func showResponse(response: MyBookingsModel.MyBookingSessions)
}

class MyBookingsPresenter: IMyBookingsPresenter {
 
    
	weak var view: IMyBookingsViewController?
	
	init(view: IMyBookingsViewController?) {
		self.view = view
	}
    
    func showErrorAlert(title: String, msg: String) {
        view?.showAlert(title: title, msg: msg)
     }
     
     func showResponse(response: MyBookingsModel.MyBookingSessions) {
        view?.showResponse(response: response)
     }
}
