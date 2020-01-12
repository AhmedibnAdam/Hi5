//
//  RegisterRouter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IRegisterRouter: class {
	// MARK : - do someting...
     func navigateToSignupPhoneVerification()
}

class RegisterRouter: IRegisterRouter {
    func navigateToSignupPhoneVerification() {
        view?.navigate(type: .modal, module: GeneralRoute.sigupVerificationPhone, completion: nil)
    }
    
	weak var view: RegisterViewController?
	
	init(view: RegisterViewController?) {
		self.view = view
	}
}
