//
//  CommentListsRouter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICommentListsRouter: class {
	// do someting...
}

class CommentListsRouter: ICommentListsRouter {	
	weak var view: CommentListsViewController?
	
	init(view: CommentListsViewController?) {
		self.view = view
	}
}
