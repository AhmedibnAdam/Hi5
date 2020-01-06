//
//  CommentListsViewController.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICommentListsViewController: class {
	var router: ICommentListsRouter? { get set }
}

class CommentListsViewController: UIViewController {
	var interactor: ICommentListsInteractor?
	var router: ICommentListsRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension CommentListsViewController: ICommentListsViewController {
	// do someting...
}

extension CommentListsViewController {
	// do someting...
}

extension CommentListsViewController {
	// do someting...
}
