//
//  ShowDetailsRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/22/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IShowDetailsRouter: class {
    func navigateToFields()
    func navigateToSessionResult(fieldId: Int , fieldName: String)
    
}

class ShowDetailsRouter: IShowDetailsRouter {	
	weak var view: ShowDetailsViewController?
	
	init(view: ShowDetailsViewController?) {
		self.view = view
	}
    func navigateToFields() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.fields, completion: nil)
    }
    func navigateToSessionResult(fieldId: Int , fieldName: String) {
        view?.navigate(type: .modal, module: GeneralRoute.sessionResult(fieldId: fieldId, fieldName: fieldName), completion: nil)
    }
}
