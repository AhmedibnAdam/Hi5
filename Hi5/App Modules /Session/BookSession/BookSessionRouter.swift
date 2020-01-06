//
//  BookSessionRouter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IBookSessionRouter: class {
	// do someting...
}

class BookSessionRouter: IBookSessionRouter {	
	weak var view: BookSessionViewController?
	
	init(view: BookSessionViewController?) {
		self.view = view
	}
}
