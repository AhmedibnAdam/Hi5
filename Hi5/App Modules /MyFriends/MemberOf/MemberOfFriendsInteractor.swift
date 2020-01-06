//
//  MemberOfFriendsInteractor.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMemberOfFriendsInteractor: class {
	var parameters: [String: Any]? { get set }
}

class MemberOfFriendsInteractor: IMemberOfFriendsInteractor {
    var presenter: IMemberOfFriendsPresenter?
    var manager: IMemberOfFriendsManager?
    var parameters: [String: Any]?

    init(presenter: IMemberOfFriendsPresenter, manager: IMemberOfFriendsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
