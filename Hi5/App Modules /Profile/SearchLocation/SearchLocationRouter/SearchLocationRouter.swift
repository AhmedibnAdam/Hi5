//
//  SearchLocationRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISearchLocationRouter: class {
	func navigateToLocation()
}

class SearchLocationRouter: ISearchLocationRouter {	
	weak var view: SearchLocationViewController?
	
	init(view: SearchLocationViewController?) {
		self.view = view
	}
    
    func navigateToLocation() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.location, completion: nil)
    }
}
