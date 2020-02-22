//
//  SocialRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/11/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISocialRouter: class {
	// do someting...
}

class SocialRouter: ISocialRouter {	
	weak var view: SocialViewController?
	
	init(view: SocialViewController?) {
		self.view = view
	}
}
