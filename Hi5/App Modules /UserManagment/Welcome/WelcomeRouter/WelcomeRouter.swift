//
//  WelcomeRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IWelcomeRouter: class {
    func navigateToCreatePassword()
    func navigateToChangeUsername()
    func navigateToLogin()
}

class WelcomeRouter: IWelcomeRouter {

	weak var view: WelcomeViewController?
	
	init(view: WelcomeViewController?) {
		self.view = view
	}
    func navigateToChangeUsername() {
        view?.navigate(type: .modal, module: GeneralRoute.changeUsername, completion: nil)
    }
    
    func navigateToCreatePassword() {
        view?.navigate(type: .modal, module: GeneralRoute.createPassword, completion: nil)
    }
    
    func navigateToLogin() {
        view?.navigate(type: .modal, module: GeneralRoute.login, completion: nil)
    }
}
