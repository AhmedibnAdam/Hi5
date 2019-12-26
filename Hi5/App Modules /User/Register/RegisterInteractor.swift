//
//  RegisterInteractor.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IRegisterInteractor: class {
	var parameters: [String: Any]? { get set }
}

class RegisterInteractor: IRegisterInteractor {
    var presenter: IRegisterPresenter?
    var manager: IRegisterManager?
    var parameters: [String: Any]?

    init(presenter: IRegisterPresenter, manager: IRegisterManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
