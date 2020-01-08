//
//  UserAccountPresenter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IUserAccountPresenter: class {
	// do someting...
}

class UserAccountPresenter: IUserAccountPresenter {	
	weak var view: IUserAccountViewController?
	
	init(view: IUserAccountViewController?) {
		self.view = view
	}
}
