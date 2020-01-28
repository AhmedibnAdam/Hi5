//
//  EditProfileRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/20/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IEditProfileRouter: class {
	func navigateToGender()
    func navigateToDateOfBirth()
    func navigateToLocation()
    func navigateToProfile()
}

class EditProfileRouter: IEditProfileRouter {	
	weak var view: EditProfileViewController?
	
	init(view: EditProfileViewController?) {
		self.view = view
	}
    
    func navigateToGender() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.gender, completion: nil)
    }
    
    func navigateToDateOfBirth() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.dateOfBirth, completion: nil)
    }
    
    func navigateToLocation() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.location, completion: nil)
    }
    
    func navigateToProfile() {
        view?.navigate(type: .modal, module: GeneralRoute.profile, completion: nil)
    }
}
