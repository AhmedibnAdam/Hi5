//
//  ForgotPhonePresenter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IForgotPhonePresenter: class {
	// do someting...
}

class ForgotPhonePresenter: IForgotPhonePresenter {	
	weak var view: IForgotPhoneViewController?
	
	init(view: IForgotPhoneViewController?) {
		self.view = view
	}
}
