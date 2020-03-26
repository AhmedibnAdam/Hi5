//
//  SideMenuRouter.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISideMenuRouter: class {
	func navigatetoProfile()
    func navigateToFields()
    func navigateToLogin()
<<<<<<< HEAD
    func navigateToSuggestField()
}

class SideMenuRouter: ISideMenuRouter {	
=======
    func navigateToMyBookings()
    func navigateToSechadule()
    func navigateToSuggestedField()
}

class SideMenuRouter: ISideMenuRouter {

>>>>>>> 02a1252cf44d981b6d1485325ac54d2ed5e0e5a5
	weak var view: SideMenuViewController?
	
	init(view: SideMenuViewController?) {
		self.view = view
	}
    func navigatetoProfile() {
        view?.navigate(type: .modal, module: GeneralRoute.profile, completion: nil)
    }
    func navigateToFields() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.fields, completion: nil)
    }
    func navigateToLogin() {
        view?.navigate(type: .modal, module: GeneralRoute.login, completion: nil)
    }
<<<<<<< HEAD
    func navigateToSuggestField() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.suggestField, completion: nil)
    }
=======
    func navigateToMyBookings() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.myBooking, completion: nil)
      }
      func navigateToSechadule() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.mySechadule, completion: nil)
      }
    func navigateToSuggestedField(){
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.suggestedField, completion: nil)
    }
      
    
      
>>>>>>> 02a1252cf44d981b6d1485325ac54d2ed5e0e5a5
}
