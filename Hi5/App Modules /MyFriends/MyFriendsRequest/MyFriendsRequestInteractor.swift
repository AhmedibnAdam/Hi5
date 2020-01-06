//
//  MyFriendsRequestInteractor.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyFriendsRequestInteractor: class {
	var parameters: [String: Any]? { get set }
}

class MyFriendsRequestInteractor: IMyFriendsRequestInteractor {
    var presenter: IMyFriendsRequestPresenter?
    var manager: IMyFriendsRequestManager?
    var parameters: [String: Any]?

    init(presenter: IMyFriendsRequestPresenter, manager: IMyFriendsRequestManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
