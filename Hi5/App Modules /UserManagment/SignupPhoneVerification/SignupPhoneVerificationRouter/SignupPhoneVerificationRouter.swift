//
//  SignupPhoneVerificationRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISignupPhoneVerificationRouter: class {
	// do someting...
    func navigateToCreatePassword()
}

class SignupPhoneVerificationRouter: ISignupPhoneVerificationRouter {
    func navigateToCreatePassword() {
        view?.navigate(type: .modal, module: GeneralRoute.welcome, completion: nil)
    }
    
	weak var view: SignupPhoneVerificationViewController?
	
	init(view: SignupPhoneVerificationViewController?) {
		self.view = view
	}
    
}
