//
//  ForgotPhoneRouter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IForgotPhoneRouter: class {
	// do someting...
}

class ForgotPhoneRouter: IForgotPhoneRouter {	
	weak var view: ForgotPhoneViewController?
	
	init(view: ForgotPhoneViewController?) {
		self.view = view
	}
}
