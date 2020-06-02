//
//  SuggestFieldRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/24/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISuggestFieldRouter: class {
	func navigateToTabBar()
}

class SuggestFieldRouter: ISuggestFieldRouter {	
	weak var view: SuggestFieldViewController?
	
	init(view: SuggestFieldViewController?) {
		self.view = view
	}
    func navigateToTabBar() {
        view?.navigate(type: .modal, module: GeneralRoute.tabBar, completion: nil)
    }
}