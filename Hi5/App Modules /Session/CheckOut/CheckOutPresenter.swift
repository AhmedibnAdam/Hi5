//
//  CheckOutPresenter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICheckOutPresenter: class {
	// do someting...
}

class CheckOutPresenter: ICheckOutPresenter {	
	weak var view: ICheckOutViewController?
	
	init(view: ICheckOutViewController?) {
		self.view = view
	}
}
