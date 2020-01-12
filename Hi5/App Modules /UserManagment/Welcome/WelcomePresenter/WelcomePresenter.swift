//
//  WelcomePresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IWelcomePresenter: class {
	// do someting...
}

class WelcomePresenter: IWelcomePresenter {	
	weak var view: IWelcomeViewController?
	
	init(view: IWelcomeViewController?) {
		self.view = view
	}
}
