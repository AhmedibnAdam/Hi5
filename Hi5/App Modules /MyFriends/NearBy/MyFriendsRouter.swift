//
//  MyFriendsRouter.swift
//  Hi5
//
//  Created by Adam on 12/31/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyFriendsRouter: class {
	// do someting...
}

class MyFriendsRouter: IMyFriendsRouter {	
	weak var view: MyFriendsViewController?
	
	init(view: MyFriendsViewController?) {
		self.view = view
	}
}
