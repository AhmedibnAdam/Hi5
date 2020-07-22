//
//  PhoneVerificationPresenter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import UIKit

protocol IPhoneVerificationPresenter: class {
    func showErrorAlert(title: String, msg: String)
    func navigateToProfile()
    func hideIndicator()

}

class PhoneVerificationPresenter: IPhoneVerificationPresenter {	
	weak var view: IPhoneVerificationViewController?
	
	init(view: IPhoneVerificationViewController?) {
		self.view = view
	}
    
    func showErrorAlert(title: String, msg: String) {
        view?.showAlert(title: title, msg: msg)
    }
    
    func navigateToProfile() {
        view?.navigateToProfile()
    }
    
    func hideIndicator() {
        view?.hideIndicator()
    }
}
