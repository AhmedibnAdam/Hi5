//
//  MyFriendsRequestPresenter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyFriendsRequestPresenter: class {
	// do someting...
}

class MyFriendsRequestPresenter: IMyFriendsRequestPresenter {	
	weak var view: IMyFriendsRequestViewController?
	
	init(view: IMyFriendsRequestViewController?) {
		self.view = view
	}
}