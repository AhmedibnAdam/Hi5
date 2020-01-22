//
//  CreatePasswordRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICreatePasswordRouter: class {
	func navigateToWelcome()
    func navigateToLogin()
    func navigateToProfile()
}

class CreatePasswordRouter: ICreatePasswordRouter {	
	weak var view: CreatePasswordViewController?
	
	init(view: CreatePasswordViewController?) {
		self.view = view
	}
    
    func navigateToWelcome() {
        view?.navigate(type: .modal, module: GeneralRoute.welcome, completion: nil)
    }
    func navigateToLogin() {
        view?.navigate(type: .modal, module: GeneralRoute.login, completion: nil)
    }
    func navigateToProfile() {
        view?.navigate(type: .modal, module: GeneralRoute.profile, completion: nil)
    }
}
