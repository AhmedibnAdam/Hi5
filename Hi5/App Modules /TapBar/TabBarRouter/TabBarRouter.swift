//
//  TabBarRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/19/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ITabBarRouter: class {
   func navigateToSideMenu()
}

class TabBarRouter: ITabBarRouter {	
	weak var view: TabBarViewController?
	
	init(view: TabBarViewController?) {
		self.view = view
	}
    func navigateToSideMenu() {
        view?.navigate(type: .modal, module: GeneralRoute.sideMenu, completion: nil)
    }
}
