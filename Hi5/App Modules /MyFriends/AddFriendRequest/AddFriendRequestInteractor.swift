//
//  AddFriendRequestInteractor.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAddFriendRequestInteractor: class {
	var parameters: [String: Any]? { get set }
}

class AddFriendRequestInteractor: IAddFriendRequestInteractor {
    var presenter: IAddFriendRequestPresenter?
    var manager: IAddFriendRequestManager?
    var parameters: [String: Any]?

    init(presenter: IAddFriendRequestPresenter, manager: IAddFriendRequestManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
