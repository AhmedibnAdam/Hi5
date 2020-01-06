//
//  CheckOutConfirmationRouter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICheckOutConfirmationRouter: class {
	// do someting...
}

class CheckOutConfirmationRouter: ICheckOutConfirmationRouter {	
	weak var view: CheckOutConfirmationViewController?
	
	init(view: CheckOutConfirmationViewController?) {
		self.view = view
	}
}
