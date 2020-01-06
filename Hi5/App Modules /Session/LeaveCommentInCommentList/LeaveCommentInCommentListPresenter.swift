//
//  LeaveCommentInCommentListPresenter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILeaveCommentInCommentListPresenter: class {
	// do someting...
}

class LeaveCommentInCommentListPresenter: ILeaveCommentInCommentListPresenter {	
	weak var view: ILeaveCommentInCommentListViewController?
	
	init(view: ILeaveCommentInCommentListViewController?) {
		self.view = view
	}
}
