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
	// MARK : - do someting...
     func navigateToNext()
}

class RegisterRouter: IRegisterRouter {
    func navigateToNext() {
        
    }
    
	weak var view: RegisterViewController?
	
	init(view: RegisterViewController?) {
		self.view = view
	}
}
