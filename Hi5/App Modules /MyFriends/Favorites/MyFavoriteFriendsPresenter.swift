//
//  MyFavoriteFriendsPresenter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyFavoriteFriendsPresenter: class {
	// do someting...
}

class MyFavoriteFriendsPresenter: IMyFavoriteFriendsPresenter {	
	weak var view: IMyFavoriteFriendsViewController?
	
	init(view: IMyFavoriteFriendsViewController?) {
		self.view = view
	}
}
