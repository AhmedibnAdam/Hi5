//
//  FilterResultPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/26/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFilterResultPresenter: class {
	// do someting...
}

class FilterResultPresenter: IFilterResultPresenter {	
	weak var view: IFilterResultViewController?
	
	init(view: IFilterResultViewController?) {
		self.view = view
	}
}
