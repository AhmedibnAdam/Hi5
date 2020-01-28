//
//  GenderRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/21/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IGenderRouter: class {
    func navigateToEditProfile(gender: String)
}

class GenderRouter: IGenderRouter {
    
	weak var view: GenderViewController?
	
	init(view: GenderViewController?) {
		self.view = view
	}
    func navigateToEditProfile(gender: String) {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.editProfile(gender: gender), completion: nil)
    }
}
