//
//  SuggestFieldDetailsRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISuggestFieldDetailsRouter: class {
	func navigateToSuggestField()
    func navigateToFieldOwnerDetails(param: [String:Any] , images: [UIImage])
}

class SuggestFieldDetailsRouter: ISuggestFieldDetailsRouter {	
	weak var view: SuggestFieldDetailsViewController?
	
	init(view: SuggestFieldDetailsViewController?) {
		self.view = view
	}
    func navigateToSuggestField() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.suggestField, completion: nil)
    }
    func navigateToFieldOwnerDetails(param: [String:Any] , images: [UIImage]) {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.fieldOwnerDetails(param: param, images: images), completion: nil)
    }
}
