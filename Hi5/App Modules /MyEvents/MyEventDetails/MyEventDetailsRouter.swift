//
//  MyEventDetailsRouter.swift
//  Hi5
//
//  Created by Adam on 7/22/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IMyEventDetailsRouter: class {
	// do someting...
}

class MyEventDetailsRouter: IMyEventDetailsRouter {	
	weak var view: MyEventDetailsViewController?
	
	init(view: MyEventDetailsViewController?) {
		self.view = view
	}
}
