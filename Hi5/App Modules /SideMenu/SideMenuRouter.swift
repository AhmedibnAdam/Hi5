//
//  SideMenuRouter.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISideMenuRouter: class {
	// do someting...
}

class SideMenuRouter: ISideMenuRouter {	
	weak var view: SideMenuViewController?
	
	init(view: SideMenuViewController?) {
		self.view = view
	}
}
