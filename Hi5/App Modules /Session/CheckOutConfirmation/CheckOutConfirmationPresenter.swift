//
//  CheckOutConfirmationPresenter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICheckOutConfirmationPresenter: class {
	// do someting...
}

class CheckOutConfirmationPresenter: ICheckOutConfirmationPresenter {	
	weak var view: ICheckOutConfirmationViewController?
	
	init(view: ICheckOutConfirmationViewController?) {
		self.view = view
	}
}
