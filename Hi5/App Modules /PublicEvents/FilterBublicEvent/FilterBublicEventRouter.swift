//
//  FilterBublicEventRouter.swift
//  Hi5
//
//  Created by Adam on 5/19/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFilterBublicEventRouter: class {
    func navigateToBublicEvent(parameters: [String: Any])
}

class FilterBublicEventRouter: IFilterBublicEventRouter {	
	weak var view: FilterBublicEventViewController?
	
	init(view: FilterBublicEventViewController?) {
		self.view = view
	}
    func navigateToBublicEvent(parameters: [String: Any]){
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.publicEvent(parameters: parameters), completion: nil)
    }

}
