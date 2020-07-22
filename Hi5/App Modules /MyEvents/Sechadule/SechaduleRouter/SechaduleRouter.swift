//
//  SechaduleRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/14/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISechaduleRouter: class {
	func navigateToTabBar()
    func navugateToDetails(event_id: String) 
}

class SechaduleRouter: ISechaduleRouter {	
	weak var view: SechaduleViewController?
	
	init(view: SechaduleViewController?) {
		self.view = view
	}
    func navigateToTabBar() {
            view?.navigate(type: .modal, module: GeneralRoute.tabBar, completion: nil)
        }
    
    func navugateToDetails(event_id: String) {
         view?.navigate(type: .modalWithNavigation, module: GeneralRoute.publicEvents(event_id: event_id), completion: nil)
     }
}
