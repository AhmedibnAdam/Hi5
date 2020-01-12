//
//  NewPasswordInteractor.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol INewPasswordInteractor: class {
	var parameters: [String: Any]? { get set }
}

class NewPasswordInteractor: INewPasswordInteractor {
    var presenter: INewPasswordPresenter?
    var manager: INewPasswordManager?
    var parameters: [String: Any]?

    init(presenter: INewPasswordPresenter, manager: INewPasswordManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
