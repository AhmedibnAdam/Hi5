//
//  ForgetPasswordPresenter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IForgetPasswordPresenter: class {
	// do someting...
}

class ForgetPasswordPresenter: IForgetPasswordPresenter {	
	weak var view: IForgetPasswordViewController?
	
	init(view: IForgetPasswordViewController?) {
		self.view = view
	}
}
