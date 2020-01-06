//
//  AddSessionResultFiltterInteractor.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAddSessionResultFiltterInteractor: class {
	var parameters: [String: Any]? { get set }
}

class AddSessionResultFiltterInteractor: IAddSessionResultFiltterInteractor {
    var presenter: IAddSessionResultFiltterPresenter?
    var manager: IAddSessionResultFiltterManager?
    var parameters: [String: Any]?

    init(presenter: IAddSessionResultFiltterPresenter, manager: IAddSessionResultFiltterManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
