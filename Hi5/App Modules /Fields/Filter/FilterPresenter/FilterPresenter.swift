//
//  FilterPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFilterPresenter: class {
	// do someting...
}

class FilterPresenter: IFilterPresenter {	
	weak var view: IFilterViewController?
	
	init(view: IFilterViewController?) {
		self.view = view
	}
}
