//
//  TabBarInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/19/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ITabBarInteractor: class {
	var parameters: [String: Any]? { get set }
}

class TabBarInteractor: ITabBarInteractor {
    var presenter: ITabBarPresenter?
    var manager: ITabBarManager?
    var parameters: [String: Any]?

    init(presenter: ITabBarPresenter, manager: ITabBarManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
