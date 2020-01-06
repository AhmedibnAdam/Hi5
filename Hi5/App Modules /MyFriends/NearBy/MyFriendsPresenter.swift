//
//  MyFriendsPresenter.swift
//  Hi5
//
//  Created by Adam on 12/31/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyFriendsPresenter: class {
	// do someting...
}

class MyFriendsPresenter: IMyFriendsPresenter {	
	weak var view: IMyFriendsViewController?
	
	init(view: IMyFriendsViewController?) {
		self.view = view
	}
}
