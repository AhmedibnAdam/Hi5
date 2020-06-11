//
//  CheckOutSessionDetailsRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICheckOutSessionDetailsRouter: class {
	func navigateToWalletSuccessCheckOut()
}

class CheckOutSessionDetailsRouter: ICheckOutSessionDetailsRouter {	
	weak var view: CheckOutSessionDetailsViewController?
	
	init(view: CheckOutSessionDetailsViewController?) {
		self.view = view
	}
    func navigateToWalletSuccessCheckOut() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.walletSuccessCheckOut, completion: nil)
    }
}
