//
//  SechadualeRouter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISechadualeRouter: class {
	// do someting...
}

class SechadualeRouter: ISechadualeRouter {	
	weak var view: SechadualeViewController?
	
	init(view: SechadualeViewController?) {
		self.view = view
	}
}
