//
//  CommentListsInteractor.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICommentListsInteractor: class {
	var parameters: [String: Any]? { get set }
}

class CommentListsInteractor: ICommentListsInteractor {
    var presenter: ICommentListsPresenter?
    var manager: ICommentListsManager?
    var parameters: [String: Any]?

    init(presenter: ICommentListsPresenter, manager: ICommentListsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
