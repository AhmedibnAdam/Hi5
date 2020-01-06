//
//  AddFriendsInteractor.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAddFriendsInteractor: class {
	var parameters: [String: Any]? { get set }
}

class AddFriendsInteractor: IAddFriendsInteractor {
    var presenter: IAddFriendsPresenter?
    var manager: IAddFriendsManager?
    var parameters: [String: Any]?

    init(presenter: IAddFriendsPresenter, manager: IAddFriendsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
