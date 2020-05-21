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
    func navigateToTabBar()
    func navigateToShowdetails(param: [String : Any], field_id: String)
}

class ProfileRouter: IProfileRouter {	
	weak var view: ProfileViewController?
	
	init(view: ProfileViewController?) {
		self.view = view
	}
    func navigateToEditProfile() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.editProfile, completion: nil)
    }
    func navigateToTabBar() {
        view?.navigate(type: .modal, module: GeneralRoute.tabBar, completion: nil)
    }
    func navigateToShowdetails(param: [String : Any], field_id: String){
        view?.navigate(type: .modal, module: GeneralRoute.showDetailsFields(param: param, field_id: field_id), completion: nil)
    }
}
