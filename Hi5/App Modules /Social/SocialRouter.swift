//
//  SocialRouter.swift
//  Hi5
//
//  Created by Adam on 12/23/19.
//  Copyright (c) 2019 Fudex. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISocialRouter: class {
	// do someting...
    func naveigateToSideMenu()
}

class SocialRouter: ISocialRouter {

	weak var view: SocialViewController?
	
	init(view: SocialViewController?) {
		self.view = view
	}
    func naveigateToSideMenu() {
//        view?.navigate(type: .present, module: GeneralRoute.userAccountViewController, completion: nil)
    }
    
}
