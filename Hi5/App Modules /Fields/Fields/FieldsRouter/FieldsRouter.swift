//
//  FieldsRouter.swift
//  Hi5
//
//  Created by Adam on 12/26/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFieldsRouter: class {
	func navigateToTabBar()
    func navigateToShowdetails(field_id: String)
    func navigateToFilter()
}

class FieldsRouter: IFieldsRouter {
   
	weak var view: FieldsViewController?
	
	init(view: FieldsViewController?) {
		self.view = view
	}
    func navigateToTabBar() {
        view?.navigate(type: .modal, module: GeneralRoute.tabBar, completion: nil)
    }
 
    func navigateToFilter() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.filter, completion: nil)
    }
    func navigateToShowdetails(field_id: String) {
           view?.navigate(type: .modal, module: GeneralRoute.showDetailsFields(field_id: field_id))
       }
       
}

