//
//  LoginRouter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILoginRouter: class {
	// do someting...
    func navigateToSignUp()
}

class LoginRouter: ILoginRouter {

	weak var view: LoginViewController?
	
	init(view: LoginViewController?) {
		self.view = view
	}
    
    func navigateToSignUp() {
        view?.navigate(type: .modal, module: GeneralRoute.register, completion: nil)
    }
}
