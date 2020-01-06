//
//  PublicEventsRouter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IPublicEventsRouter: class {
	// do someting...
}

class PublicEventsRouter: IPublicEventsRouter {	
	weak var view: PublicEventsViewController?
	
	init(view: PublicEventsViewController?) {
		self.view = view
	}
}
