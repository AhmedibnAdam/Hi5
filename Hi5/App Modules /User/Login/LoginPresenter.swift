//
//  LoginPresenter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILoginPresenter: class {
	// do someting...
}

class LoginPresenter: ILoginPresenter {	
	weak var view: ILoginViewController?
	
	init(view: ILoginViewController?) {
		self.view = view
	}
}
