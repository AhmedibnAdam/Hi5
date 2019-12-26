//
//  UserAccountRouter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IUserAccountRouter: class {
	// do someting...
}

class UserAccountRouter: IUserAccountRouter {	
	weak var view: UserAccountViewController?
	
	init(view: UserAccountViewController?) {
		self.view = view
	}
}
