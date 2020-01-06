//
//  AddFriendsRouter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAddFriendsRouter: class {
	// do someting...
}

class AddFriendsRouter: IAddFriendsRouter {	
	weak var view: AddFriendsViewController?
	
	init(view: AddFriendsViewController?) {
		self.view = view
	}
}
