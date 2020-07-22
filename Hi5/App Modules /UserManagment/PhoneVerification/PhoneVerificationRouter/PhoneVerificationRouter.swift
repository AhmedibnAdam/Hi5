//
//  PhoneVerificationRouter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import UIKit

protocol IPhoneVerificationRouter: class {
	func navigateToProfile()
}

class PhoneVerificationRouter: IPhoneVerificationRouter {	
	weak var view: PhoneVerificationViewController?
	
	init(view: PhoneVerificationViewController?) {
		self.view = view
	}
    func navigateToProfile() {
        view?.navigate(type: .modal, module: GeneralRoute.tabBar, completion: nil)
    }
}
