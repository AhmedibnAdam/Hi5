//
//  SessionResultRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/4/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISessionResultRouter: class {
	// do someting...
}

class SessionResultRouter: ISessionResultRouter {	
	weak var view: SessionResultViewController?
	
	init(view: SessionResultViewController?) {
		self.view = view
	}
}
