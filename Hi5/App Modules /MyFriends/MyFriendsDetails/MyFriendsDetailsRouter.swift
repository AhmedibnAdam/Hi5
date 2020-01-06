//
//  MyFriendsDetailsRouter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyFriendsDetailsRouter: class {
	// do someting...
}

class MyFriendsDetailsRouter: IMyFriendsDetailsRouter {	
	weak var view: MyFriendsDetailsViewController?
	
	init(view: MyFriendsDetailsViewController?) {
		self.view = view
	}
}
