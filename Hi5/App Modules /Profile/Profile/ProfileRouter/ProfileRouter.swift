//
//  ProfileRouter.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IProfileRouter: class {
	func navigateToEditProfile()
}

class ProfileRouter: IProfileRouter {	
	weak var view: ProfileViewController?
	
	init(view: ProfileViewController?) {
		self.view = view
	}
    func navigateToEditProfile() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.editProfile(gender: nil), completion: nil)
    }
}
