//
//  CommentPresenter.swift
//  Hi5
//
//  Created by Adam on 5/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICommentPresenter: class {
	// do someting...
}

class CommentPresenter: ICommentPresenter {	
	weak var view: ICommentViewController?
	
	init(view: ICommentViewController?) {
		self.view = view
	}
}
