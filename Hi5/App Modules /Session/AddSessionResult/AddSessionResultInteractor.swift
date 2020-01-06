//
//  AddSessionResultInteractor.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAddSessionResultInteractor: class {
	var parameters: [String: Any]? { get set }
}

class AddSessionResultInteractor: IAddSessionResultInteractor {
    var presenter: IAddSessionResultPresenter?
    var manager: IAddSessionResultManager?
    var parameters: [String: Any]?

    init(presenter: IAddSessionResultPresenter, manager: IAddSessionResultManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
