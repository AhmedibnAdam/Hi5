//
//  MemberOfFriendsRouter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMemberOfFriendsRouter: class {
	// do someting...
}

class MemberOfFriendsRouter: IMemberOfFriendsRouter {	
	weak var view: MemberOfFriendsViewController?
	
	init(view: MemberOfFriendsViewController?) {
		self.view = view
	}
}
