//
//  SideMenuInteractor.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISideMenuInteractor: class {
	var parameters: [String: Any]? { get set }
}

class SideMenuInteractor: ISideMenuInteractor {
    var presenter: ISideMenuPresenter?
    var manager: ISideMenuManager?
    var parameters: [String: Any]?

    init(presenter: ISideMenuPresenter, manager: ISideMenuManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
