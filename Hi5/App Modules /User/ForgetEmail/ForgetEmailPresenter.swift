//
//  ForgetEmailPresenter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IForgetEmailPresenter: class {
	// do someting...
}

class ForgetEmailPresenter: IForgetEmailPresenter {	
	weak var view: IForgetEmailViewController?
	
	init(view: IForgetEmailViewController?) {
		self.view = view
	}
}
