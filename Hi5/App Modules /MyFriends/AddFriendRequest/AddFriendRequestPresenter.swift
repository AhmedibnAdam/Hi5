//
//  AddFriendRequestPresenter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAddFriendRequestPresenter: class {
	// do someting...
}

class AddFriendRequestPresenter: IAddFriendRequestPresenter {	
	weak var view: IAddFriendRequestViewController?
	
	init(view: IAddFriendRequestViewController?) {
		self.view = view
	}
}
