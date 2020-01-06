//
//  MyFriendsDetailsPresenter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyFriendsDetailsPresenter: class {
	// do someting...
}

class MyFriendsDetailsPresenter: IMyFriendsDetailsPresenter {	
	weak var view: IMyFriendsDetailsViewController?
	
	init(view: IMyFriendsDetailsViewController?) {
		self.view = view
	}
}
