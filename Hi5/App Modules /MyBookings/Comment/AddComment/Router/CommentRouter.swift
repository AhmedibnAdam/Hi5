//
//  CommentRouter.swift
//  Hi5
//
//  Created by Adam on 5/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICommentRouter: class {
	// do someting...
}

class CommentRouter: ICommentRouter {	
	weak var view: CommentViewController?
	
	init(view: CommentViewController?) {
		self.view = view
	}
}
