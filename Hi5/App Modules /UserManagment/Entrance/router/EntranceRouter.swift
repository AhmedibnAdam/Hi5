//
//  EntranceRouter.swift
//  Hi5
//
//  Created by Adam on 7/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IEntranceRouter: class {
     func navigateToLogin()
	 func NavigateToRegister()
}

class EntranceRouter: IEntranceRouter {	
	weak var view: EntranceViewController?
	
	init(view: EntranceViewController?) {
		self.view = view
	}
    
    func navigateToLogin(){
        view?.navigate(type: .modal, module: GeneralRoute.login, completion: nil)
    }
    func NavigateToRegister(){
         view?.navigate(type: .modal, module: GeneralRoute.register, completion: nil)
    }
}
