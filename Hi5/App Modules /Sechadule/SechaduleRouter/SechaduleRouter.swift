//
//  SechaduleRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/14/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISechaduleRouter: class {
	// do someting...
}

class SechaduleRouter: ISechaduleRouter {	
	weak var view: SechaduleViewController?
	
	init(view: SechaduleViewController?) {
		self.view = view
	}
}
