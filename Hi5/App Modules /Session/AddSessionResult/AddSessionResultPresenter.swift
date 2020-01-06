//
//  AddSessionResultPresenter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAddSessionResultPresenter: class {
	// do someting...
}

class AddSessionResultPresenter: IAddSessionResultPresenter {	
	weak var view: IAddSessionResultViewController?
	
	init(view: IAddSessionResultViewController?) {
		self.view = view
	}
}
