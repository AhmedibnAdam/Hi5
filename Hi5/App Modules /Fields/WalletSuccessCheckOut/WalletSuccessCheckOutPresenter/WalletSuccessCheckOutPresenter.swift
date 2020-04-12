//
//  WalletSuccessCheckOutPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/9/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IWalletSuccessCheckOutPresenter: class {
	// do someting...
}

class WalletSuccessCheckOutPresenter: IWalletSuccessCheckOutPresenter {	
	weak var view: IWalletSuccessCheckOutViewController?
	
	init(view: IWalletSuccessCheckOutViewController?) {
		self.view = view
	}
}
