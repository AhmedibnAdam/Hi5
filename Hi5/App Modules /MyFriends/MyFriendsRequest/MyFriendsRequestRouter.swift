//
//  MyFriendsRequestRouter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyFriendsRequestRouter: class {
	// do someting...
}

class MyFriendsRequestRouter: IMyFriendsRequestRouter {	
	weak var view: MyFriendsRequestViewController?
	
	init(view: MyFriendsRequestViewController?) {
		self.view = view
	}
}
