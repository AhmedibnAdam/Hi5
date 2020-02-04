//
//  LocationRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/26/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILocationRouter: class {
	func navigateToSearchLocation()
    func navigateToEditProfile()
}

class LocationRouter: ILocationRouter {	
	weak var view: LocationViewController?
	
	init(view: LocationViewController?) {
		self.view = view
	}
    func navigateToSearchLocation() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.searchLocation, completion: nil)
    }
    func navigateToEditProfile() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.editProfile, completion: nil)
    }
}
