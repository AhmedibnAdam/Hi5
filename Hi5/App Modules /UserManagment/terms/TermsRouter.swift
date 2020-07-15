//
//  TermsRouter.swift
//  Hi5
//
//  Created by Adam on 7/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol ITermsRouter: class {
	// do someting...
}

class TermsRouter: ITermsRouter {	
	weak var view: TermsViewController?
	
	init(view: TermsViewController?) {
		self.view = view
	}
}
