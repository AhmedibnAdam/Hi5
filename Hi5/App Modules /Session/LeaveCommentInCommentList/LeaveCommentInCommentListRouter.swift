//
//  LeaveCommentInCommentListRouter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILeaveCommentInCommentListRouter: class {
	// do someting...
}

class LeaveCommentInCommentListRouter: ILeaveCommentInCommentListRouter {	
	weak var view: LeaveCommentInCommentListViewController?
	
	init(view: LeaveCommentInCommentListViewController?) {
		self.view = view
	}
}
