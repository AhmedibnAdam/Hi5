//
//  SuggestedFieldsRouter.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISuggestedFieldsRouter: class {
	// do someting...
}

class SuggestedFieldsRouter: ISuggestedFieldsRouter {	
	weak var view: SuggestedFieldsViewController?
	
	init(view: SuggestedFieldsViewController?) {
		self.view = view
	}
}
