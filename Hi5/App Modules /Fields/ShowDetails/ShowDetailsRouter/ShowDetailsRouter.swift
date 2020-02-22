//
//  ShowDetailsRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/22/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IShowDetailsRouter: class {
	// do someting...
}

class ShowDetailsRouter: IShowDetailsRouter {	
	weak var view: ShowDetailsViewController?
	
	init(view: ShowDetailsViewController?) {
		self.view = view
	}
}
