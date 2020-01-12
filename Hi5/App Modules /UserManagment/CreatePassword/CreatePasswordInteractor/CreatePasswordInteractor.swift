//
//  CreatePasswordInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICreatePasswordInteractor: class {
	var parameters: [String: Any]? { get set }
}

class CreatePasswordInteractor: ICreatePasswordInteractor {
    var presenter: ICreatePasswordPresenter?
    var manager: ICreatePasswordManager?
    var parameters: [String: Any]?

    init(presenter: ICreatePasswordPresenter, manager: ICreatePasswordManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
