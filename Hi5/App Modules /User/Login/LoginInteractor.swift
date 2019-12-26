//
//  LoginInteractor.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILoginInteractor: class {
	var parameters: [String: Any]? { get set }
}

class LoginInteractor: ILoginInteractor {
    var presenter: ILoginPresenter?
    var manager: ILoginManager?
    var parameters: [String: Any]?

    init(presenter: ILoginPresenter, manager: ILoginManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}