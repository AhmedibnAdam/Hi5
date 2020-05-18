//
//  CommentInteractor.swift
//  Hi5
//
//  Created by Adam on 5/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICommentInteractor: class {
	var parameters: [String: Any]? { get set }
}

class CommentInteractor: ICommentInteractor {
    var presenter: ICommentPresenter?
    var manager: ICommentManager?
    var parameters: [String: Any]?

    init(presenter: ICommentPresenter, manager: ICommentManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
