//
//  MemberOfFriendsPresenter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMemberOfFriendsPresenter: class {
	// do someting...
}

class MemberOfFriendsPresenter: IMemberOfFriendsPresenter {	
	weak var view: IMemberOfFriendsViewController?
	
	init(view: IMemberOfFriendsViewController?) {
		self.view = view
	}
}
