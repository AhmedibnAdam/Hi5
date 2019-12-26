//
//  PhoneVerificationRouter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IPhoneVerificationRouter: class {
	// do someting...
}

class PhoneVerificationRouter: IPhoneVerificationRouter {	
	weak var view: PhoneVerificationViewController?
	
	init(view: PhoneVerificationViewController?) {
		self.view = view
	}
}
