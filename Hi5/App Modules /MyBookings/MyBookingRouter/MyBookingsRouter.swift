//
//  MyBookingsRouter.swift
//  Hi5
//
//  Created by Adam on 3/18/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyBookingsRouter: class {
	func navigateToTabBar()
}

class MyBookingsRouter: IMyBookingsRouter {	
	weak var view: MyBookingsViewController?
	
	init(view: MyBookingsViewController?) {
		self.view = view
	}
    func navigateToTabBar() {
         view?.navigate(type: .modal, module: GeneralRoute.tabBar, completion: nil)
     }
    
}
