//
//  PhoneVerificationPresenter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IPhoneVerificationPresenter: class {
	// do someting...
}

class PhoneVerificationPresenter: IPhoneVerificationPresenter {	
	weak var view: IPhoneVerificationViewController?
	
	init(view: IPhoneVerificationViewController?) {
		self.view = view
	}
}
