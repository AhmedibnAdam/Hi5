//
//  LeaveCommentInCommentListViewController.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILeaveCommentInCommentListViewController: class {
	var router: ILeaveCommentInCommentListRouter? { get set }
}

class LeaveCommentInCommentListViewController: UIViewController {
	var interactor: ILeaveCommentInCommentListInteractor?
	var router: ILeaveCommentInCommentListRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension LeaveCommentInCommentListViewController: ILeaveCommentInCommentListViewController {
	// do someting...
}

extension LeaveCommentInCommentListViewController {
	// do someting...
}

extension LeaveCommentInCommentListViewController {
	// do someting...
}
