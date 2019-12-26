//
//  ForgetPasswordInteractor.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IForgetPasswordInteractor: class {
	var parameters: [String: Any]? { get set }
}

class ForgetPasswordInteractor: IForgetPasswordInteractor {
    var presenter: IForgetPasswordPresenter?
    var manager: IForgetPasswordManager?
    var parameters: [String: Any]?

    init(presenter: IForgetPasswordPresenter, manager: IForgetPasswordManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
