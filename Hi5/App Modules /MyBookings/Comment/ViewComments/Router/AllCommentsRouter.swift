//
//  AllCommentsRouter.swift
//  Hi5
//
//  Created by Adam on 5/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAllCommentsRouter: class {
	// do someting...
}

class AllCommentsRouter: IAllCommentsRouter {	
	weak var view: AllCommentsViewController?
	
	init(view: AllCommentsViewController?) {
		self.view = view
	}
}
