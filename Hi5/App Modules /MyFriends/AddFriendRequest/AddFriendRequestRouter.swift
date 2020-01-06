//
//  AddFriendRequestRouter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAddFriendRequestRouter: class {
	// do someting...
}

class AddFriendRequestRouter: IAddFriendRequestRouter {	
	weak var view: AddFriendRequestViewController?
	
	init(view: AddFriendRequestViewController?) {
		self.view = view
	}
}
