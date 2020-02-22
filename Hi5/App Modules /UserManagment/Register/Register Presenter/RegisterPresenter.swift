//
//  RegisterPresenter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IRegisterPresenter: class {
	// MARK : - do someting...
    func showErrorAlert(title: String, msg: String)
    func navigateToSignupPhoneVerification()
    func hideIndicator()
}

class RegisterPresenter: IRegisterPresenter {

	weak var view: IRegisterViewController?
	
	init(view: IRegisterViewController?) {
		self.view = view
	}
    
    func showErrorAlert(title: String, msg: String) {
        view?.showAlert(title: title, msg: msg)
    }
    
    func navigateToSignupPhoneVerification() {
        view?.navigateToSignupPhoneVerification()
    }
    
    func hideIndicator() {
        view?.hideIndicator()
    }
}
