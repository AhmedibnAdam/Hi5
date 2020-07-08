//
//  ForgetPasswordRouter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IForgetPasswordRouter: class {
	// do someting...
     func navigateToForgetPhone()
     func navigateToForgetEmail()
}

class ForgetPasswordRouter: IForgetPasswordRouter {
    func navigateToForgetPhone() {
        view?.navigate(type: .modal, module: GeneralRoute.sigupVerificationPhone, completion: nil)
    }
    func navigateToForgetEmail() {
        view?.navigate(type: .modal, module: GeneralRoute.phoneVerification, completion: nil)
    }
    
	weak var view: ForgetPasswordViewController?
	
	init(view: ForgetPasswordViewController?) {
		self.view = view
	}
}
