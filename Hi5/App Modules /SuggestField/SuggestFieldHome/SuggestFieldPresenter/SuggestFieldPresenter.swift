//
//  SuggestFieldPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/24/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISuggestFieldPresenter: class {
	// do someting...
}

class SuggestFieldPresenter: ISuggestFieldPresenter {	
	weak var view: ISuggestFieldViewController?
	
	init(view: ISuggestFieldViewController?) {
		self.view = view
	}
}
