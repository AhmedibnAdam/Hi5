//
//  MakeWalletPasswordPresenter.swift
//  Hi5
//
//  Created by Adam on 1/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMakeWalletPasswordPresenter: class {
	// do someting...
}

class MakeWalletPasswordPresenter: IMakeWalletPasswordPresenter {	
	weak var view: IMakeWalletPasswordViewController?
	
	init(view: IMakeWalletPasswordViewController?) {
		self.view = view
	}
}
