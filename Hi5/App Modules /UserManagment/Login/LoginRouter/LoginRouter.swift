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
    func navigateToSignUp()
    func navigateToForgetPassword()
    func navigateToProfile()
    func navigateToTabBar()
    func navigateToFields()
}

class LoginRouter: ILoginRouter {

	weak var view: LoginViewController?
	
	init(view: LoginViewController?) {
		self.view = view
	}
    
    func navigateToSignUp() {
        view?.navigate(type: .modal, module: GeneralRoute.register, completion: nil)
    }
    
    func navigateToForgetPassword() {
        view?.navigate(type: .modal, module: GeneralRoute.forgetPassword, completion: nil)
    }
    
    func navigateToProfile() {
        view?.navigate(type: .modal, module: GeneralRoute.profile, completion: nil)
    }
    
    func navigateToTabBar() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.tabBar, completion: nil)
    }
    func navigateToFields() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.fields, completion: nil)
    }
}
