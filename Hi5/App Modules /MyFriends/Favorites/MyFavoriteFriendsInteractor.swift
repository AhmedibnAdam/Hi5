//
//  MyFavoriteFriendsInteractor.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyFavoriteFriendsInteractor: class {
	var parameters: [String: Any]? { get set }
}

class MyFavoriteFriendsInteractor: IMyFavoriteFriendsInteractor {
    var presenter: IMyFavoriteFriendsPresenter?
    var manager: IMyFavoriteFriendsManager?
    var parameters: [String: Any]?

    init(presenter: IMyFavoriteFriendsPresenter, manager: IMyFavoriteFriendsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
