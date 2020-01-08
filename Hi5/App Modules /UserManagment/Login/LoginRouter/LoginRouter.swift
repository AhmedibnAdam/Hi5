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
    func navigateToNext()
}

class LoginRouter: ILoginRouter {
   
    
  
	weak var view: LoginViewController?
	
	init(view: LoginViewController?) {
		self.view = view
	}
    func navigateToNext() {
        view?.navigate(type: .modal, module: GeneralRoute.register, completion: nil)
       }
}
