//
//  EmailVerficationRouter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IEmailVerficationRouter: class {
	// do someting...
}

class EmailVerficationRouter: IEmailVerficationRouter {	
	weak var view: EmailVerficationViewController?
	
	init(view: EmailVerficationViewController?) {
		self.view = view
	}
}
