//
//  HelpCenterPresenter.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IHelpCenterPresenter: class {
	// do someting...
}

class HelpCenterPresenter: IHelpCenterPresenter {	
	weak var view: IHelpCenterViewController?
	
	init(view: IHelpCenterViewController?) {
		self.view = view
	}
}
