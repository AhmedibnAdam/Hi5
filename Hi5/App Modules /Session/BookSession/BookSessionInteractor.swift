//
//  BookSessionInteractor.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IBookSessionInteractor: class {
	var parameters: [String: Any]? { get set }
}

class BookSessionInteractor: IBookSessionInteractor {
    var presenter: IBookSessionPresenter?
    var manager: IBookSessionManager?
    var parameters: [String: Any]?

    init(presenter: IBookSessionPresenter, manager: IBookSessionManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
