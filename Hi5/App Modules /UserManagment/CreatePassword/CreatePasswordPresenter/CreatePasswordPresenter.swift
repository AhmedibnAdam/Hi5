//
//  CreatePasswordPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICreatePasswordPresenter: class {
	// do someting...
}

class CreatePasswordPresenter: ICreatePasswordPresenter {	
	weak var view: ICreatePasswordViewController?
	
	init(view: ICreatePasswordViewController?) {
		self.view = view
	}
}
