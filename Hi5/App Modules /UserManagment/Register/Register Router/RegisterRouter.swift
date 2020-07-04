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
     func navigateToCreateUserName(param: [String: Any])
     func navigateToLogin()
}
class RegisterRouter: IRegisterRouter {
    func navigateToCreateUserName(param: [String: Any]) {
        view?.navigate(type: .modal, module: GeneralRoute.changeUsername(param: param), completion: nil)
    }
	weak var view: RegisterViewController?
	init(view: RegisterViewController?) {
		self.view = view
	}
    func navigateToLogin() {
        view?.navigate(type: .modal, module: GeneralRoute.login, completion: nil)
    }
}
