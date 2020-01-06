//
//  MyFavoriteFriendsRouter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyFavoriteFriendsRouter: class {
	// do someting...
}

class MyFavoriteFriendsRouter: IMyFavoriteFriendsRouter {	
	weak var view: MyFavoriteFriendsViewController?
	
	init(view: MyFavoriteFriendsViewController?) {
		self.view = view
	}
}
