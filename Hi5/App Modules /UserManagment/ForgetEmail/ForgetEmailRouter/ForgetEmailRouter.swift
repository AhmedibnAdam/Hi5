//
//  ForgetEmailRouter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import UIKit

protocol IForgetEmailRouter: class {
	// do someting...
     func navigateToVerificationEmail()
}

class ForgetEmailRouter: IForgetEmailRouter {
    func navigateToVerificationEmail() {
        view?.navigate(type: .modal, module: GeneralRoute.emailVerification, completion: nil)
    }
    
	weak var view: ForgetEmailViewController?
	
	init(view: ForgetEmailViewController?) {
		self.view = view
	}
}
