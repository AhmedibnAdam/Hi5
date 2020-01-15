//
//  SignupPhoneVerificationPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISignupPhoneVerificationPresenter: class {
    func showErrorAlert(title: String, msg: String)
    func navigateToCreatePassword()
}

class SignupPhoneVerificationPresenter: ISignupPhoneVerificationPresenter {	
	weak var view: ISignupPhoneVerificationViewController?
	
	init(view: ISignupPhoneVerificationViewController?) {
		self.view = view
	}
    
    func showErrorAlert(title: String, msg: String) {
        view?.showAlert(title: title, msg: msg)
    }
    
    func navigateToCreatePassword() {
        view?.navigateToCreatePassword()
    }
}
