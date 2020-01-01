//
//  SuggestedFieldsPresenter.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISuggestedFieldsPresenter: class {
	// do someting...
}

class SuggestedFieldsPresenter: ISuggestedFieldsPresenter {	
	weak var view: ISuggestedFieldsViewController?
	
	init(view: ISuggestedFieldsViewController?) {
		self.view = view
	}
}
