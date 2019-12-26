//
//  UserAccountInteractor.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IUserAccountInteractor: class {
	var parameters: [String: Any]? { get set }
}

class UserAccountInteractor: IUserAccountInteractor {
    var presenter: IUserAccountPresenter?
    var manager: IUserAccountManager?
    var parameters: [String: Any]?

    init(presenter: IUserAccountPresenter, manager: IUserAccountManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
