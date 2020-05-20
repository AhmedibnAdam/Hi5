//
//  NewPasswordRouter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol INewPasswordRouter: class {
	func navigateToLogin()
    func navigateToProfile(param: [String : Any], id: Int)
}

class NewPasswordRouter: INewPasswordRouter {	
	weak var view: NewPasswordViewController?
	
	init(view: NewPasswordViewController?) {
		self.view = view
	}
    func navigateToLogin() {
        view?.navigate(type: .modal, module: GeneralRoute.login, completion: nil)
    }
    func navigateToProfile(param: [String : Any], id: Int) {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.profile(param: ["":""], id: 0), completion: nil)
    }
}
