//
//  NewPasswordPresenter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol INewPasswordPresenter: class {
	// do someting...
}

class NewPasswordPresenter: INewPasswordPresenter {	
	weak var view: INewPasswordViewController?
	
	init(view: INewPasswordViewController?) {
		self.view = view
	}
}
