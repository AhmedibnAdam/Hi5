//
//  WalletPresenter.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IWalletPresenter: class {
	// do someting...
}

class WalletPresenter: IWalletPresenter {	
	weak var view: IWalletViewController?
	
	init(view: IWalletViewController?) {
		self.view = view
	}
}
