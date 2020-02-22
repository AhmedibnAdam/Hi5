//
//  SideMenuPresenter.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISideMenuPresenter: class {
	// do someting...
}

class SideMenuPresenter: ISideMenuPresenter {	
	weak var view: ISideMenuViewController?
	
	init(view: ISideMenuViewController?) {
		self.view = view
	}
}
