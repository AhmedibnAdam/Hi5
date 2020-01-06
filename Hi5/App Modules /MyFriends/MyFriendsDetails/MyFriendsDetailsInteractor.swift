//
//  MyFriendsDetailsInteractor.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyFriendsDetailsInteractor: class {
	var parameters: [String: Any]? { get set }
}

class MyFriendsDetailsInteractor: IMyFriendsDetailsInteractor {
    var presenter: IMyFriendsDetailsPresenter?
    var manager: IMyFriendsDetailsManager?
    var parameters: [String: Any]?

    init(presenter: IMyFriendsDetailsPresenter, manager: IMyFriendsDetailsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
