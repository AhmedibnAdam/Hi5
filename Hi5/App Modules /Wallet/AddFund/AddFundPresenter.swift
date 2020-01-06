//
//  AddFundPresenter.swift
//  Hi5
//
//  Created by Adam on 1/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAddFundPresenter: class {
	// do someting...
}

class AddFundPresenter: IAddFundPresenter {	
	weak var view: IAddFundViewController?
	
	init(view: IAddFundViewController?) {
		self.view = view
	}
}
