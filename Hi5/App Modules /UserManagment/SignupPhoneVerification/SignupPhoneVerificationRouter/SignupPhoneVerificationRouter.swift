//
//  SignupPhoneVerificationRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.


import UIKit

protocol ISignupPhoneVerificationRouter: class {
    func navigateToCreatePassword(phone: String)
    func navigateToLogin()
}

class SignupPhoneVerificationRouter: ISignupPhoneVerificationRouter {

	weak var view: SignupPhoneVerificationViewController?
	
	init(view: SignupPhoneVerificationViewController?) {
		self.view = view
	}
    func navigateToCreatePassword(phone: String) {
        view?.navigate(type: .modal, module: GeneralRoute.newPassword(phone: phone), completion: nil)
    }
    func navigateToLogin() {
        view?.navigate(type: .modal, module: GeneralRoute.login, completion: nil)
    }
    
}
