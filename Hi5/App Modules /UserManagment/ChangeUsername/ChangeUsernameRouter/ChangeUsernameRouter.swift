//
//  ChangeUsernameRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.


import UIKit

protocol IChangeUsernameRouter: class {
	func navigateToCreatePassword(param: [String : Any])
    func navigateToLogin()
}

class ChangeUsernameRouter: IChangeUsernameRouter {	
	weak var view: ChangeUsernameViewController?
	
	init(view: ChangeUsernameViewController?) {
		self.view = view
	}
    func navigateToCreatePassword(param: [String : Any]) {
        view?.navigate(type: .modal, module: GeneralRoute.createPassword(param: param), completion: nil)
    }
    func navigateToLogin() {
        view?.navigate(type: .modal, module: GeneralRoute.login, completion: nil)
    }
}
