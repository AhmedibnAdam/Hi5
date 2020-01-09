//
//  ForgetEmailRouter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IForgetEmailRouter: class {
	// do someting...
     func navigateToVerificationEmail()
}

class ForgetEmailRouter: IForgetEmailRouter {
    func navigateToVerificationEmail() {
        view?.navigate(type: .modal, module: GeneralRoute.verificationEmail, completion: nil)
    }
    
	weak var view: ForgetEmailViewController?
	
	init(view: ForgetEmailViewController?) {
		self.view = view
	}
}
