//
//  MakeWalletPasswordRouter.swift
//  Hi5
//
//  Created by Adam on 1/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMakeWalletPasswordRouter: class {
	// do someting...
}

class MakeWalletPasswordRouter: IMakeWalletPasswordRouter {	
	weak var view: MakeWalletPasswordViewController?
	
	init(view: MakeWalletPasswordViewController?) {
		self.view = view
	}
}
