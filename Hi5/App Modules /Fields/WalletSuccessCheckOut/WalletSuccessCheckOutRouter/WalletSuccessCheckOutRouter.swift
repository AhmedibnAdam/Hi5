//
//  WalletSuccessCheckOutRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/9/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IWalletSuccessCheckOutRouter: class {
	// do someting...
}

class WalletSuccessCheckOutRouter: IWalletSuccessCheckOutRouter {	
	weak var view: WalletSuccessCheckOutViewController?
	
	init(view: WalletSuccessCheckOutViewController?) {
		self.view = view
	}
}
