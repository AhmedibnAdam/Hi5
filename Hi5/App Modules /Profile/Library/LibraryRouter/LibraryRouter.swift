//
//  LibraryRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILibraryRouter: class {
	// do someting...
}

class LibraryRouter: ILibraryRouter {	
	weak var view: LibraryViewController?
	
	init(view: LibraryViewController?) {
		self.view = view
	}
}
