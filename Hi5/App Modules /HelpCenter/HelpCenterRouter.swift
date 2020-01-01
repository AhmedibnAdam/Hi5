//
//  HelpCenterRouter.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IHelpCenterRouter: class {
	// do someting...
}

class HelpCenterRouter: IHelpCenterRouter {	
	weak var view: HelpCenterViewController?
	
	init(view: HelpCenterViewController?) {
		self.view = view
	}
}
