//
//  AddSessionResultFiltterPresenter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAddSessionResultFiltterPresenter: class {
	// do someting...
}

class AddSessionResultFiltterPresenter: IAddSessionResultFiltterPresenter {	
	weak var view: IAddSessionResultFiltterViewController?
	
	init(view: IAddSessionResultFiltterViewController?) {
		self.view = view
	}
}
