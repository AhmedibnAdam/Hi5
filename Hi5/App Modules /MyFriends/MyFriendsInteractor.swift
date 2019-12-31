//
//  MyFriendsInteractor.swift
//  Hi5
//
//  Created by Adam on 12/31/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyFriendsInteractor: class {
	var parameters: [String: Any]? { get set }
}

class MyFriendsInteractor: IMyFriendsInteractor {
    var presenter: IMyFriendsPresenter?
    var manager: IMyFriendsManager?
    var parameters: [String: Any]?

    init(presenter: IMyFriendsPresenter, manager: IMyFriendsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
