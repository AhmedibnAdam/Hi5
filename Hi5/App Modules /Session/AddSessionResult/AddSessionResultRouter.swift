//
//  AddSessionResultRouter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAddSessionResultRouter: class {
	// do someting...
}

class AddSessionResultRouter: IAddSessionResultRouter {	
	weak var view: AddSessionResultViewController?
	
	init(view: AddSessionResultViewController?) {
		self.view = view
	}
}
