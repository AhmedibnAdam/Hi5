//
//  ChangeUsernameRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IChangeUsernameRouter: class {
	func navigateToCreatePassword()
}

class ChangeUsernameRouter: IChangeUsernameRouter {	
	weak var view: ChangeUsernameViewController?
	
	init(view: ChangeUsernameViewController?) {
		self.view = view
	}
    func navigateToCreatePassword() {
        view?.navigate(type: .modal, module: GeneralRoute.createPassword, completion: nil)
    }
}
