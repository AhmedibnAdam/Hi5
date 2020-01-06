//
//  LeaveCommentInCommentListInteractor.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILeaveCommentInCommentListInteractor: class {
	var parameters: [String: Any]? { get set }
}

class LeaveCommentInCommentListInteractor: ILeaveCommentInCommentListInteractor {
    var presenter: ILeaveCommentInCommentListPresenter?
    var manager: ILeaveCommentInCommentListManager?
    var parameters: [String: Any]?

    init(presenter: ILeaveCommentInCommentListPresenter, manager: ILeaveCommentInCommentListManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
