//
//  WalletRouter.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IWalletRouter: class {
	// do someting...
}

class WalletRouter: IWalletRouter {	
	weak var view: WalletViewController?
	
	init(view: WalletViewController?) {
		self.view = view
	}
}
