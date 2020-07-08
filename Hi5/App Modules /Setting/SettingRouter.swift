//
//  SettingRouter.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISettingRouter: class {
	// do someting...
     func navigateToLogin() 
}

class SettingRouter: ISettingRouter {	
	weak var view: SettingViewController?
	
	init(view: SettingViewController?) {
		self.view = view
	}
    func navigateToLogin() {
           view?.navigate(type: .modal, module: GeneralRoute.login, completion: nil)
       }
}
