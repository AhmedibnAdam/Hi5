//
//  PublicEventDetailsRouter.swift
//  Hi5
//
//  Created by Adam on 4/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IPublicEventDetailsRouter: class {
	// do someting...
}

class PublicEventDetailsRouter: IPublicEventDetailsRouter {	
	weak var view: PublicEventDetailsViewController?
	
	init(view: PublicEventDetailsViewController?) {
		self.view = view
	}
}
