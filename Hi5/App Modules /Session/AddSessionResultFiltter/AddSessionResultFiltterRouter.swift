//
//  AddSessionResultFiltterRouter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAddSessionResultFiltterRouter: class {
	// do someting...
}

class AddSessionResultFiltterRouter: IAddSessionResultFiltterRouter {	
	weak var view: AddSessionResultFiltterViewController?
	
	init(view: AddSessionResultFiltterViewController?) {
		self.view = view
	}
}
