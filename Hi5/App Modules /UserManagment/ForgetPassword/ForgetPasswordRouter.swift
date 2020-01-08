//
//  ForgetPasswordRouter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IForgetPasswordRouter: class {
	// do someting...
     func navigateToNext()
}

class ForgetPasswordRouter: IForgetPasswordRouter {
    func navigateToNext() {
        
    }
    
	weak var view: ForgetPasswordViewController?
	
	init(view: ForgetPasswordViewController?) {
		self.view = view
	}
}
