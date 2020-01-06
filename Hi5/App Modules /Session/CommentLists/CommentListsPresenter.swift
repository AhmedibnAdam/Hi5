//
//  CommentListsPresenter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICommentListsPresenter: class {
	// do someting...
}

class CommentListsPresenter: ICommentListsPresenter {	
	weak var view: ICommentListsViewController?
	
	init(view: ICommentListsViewController?) {
		self.view = view
	}
}
