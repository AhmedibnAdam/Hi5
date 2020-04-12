//
//  CheckOutSessionDetailsPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICheckOutSessionDetailsPresenter: class {
	// do someting...
}

class CheckOutSessionDetailsPresenter: ICheckOutSessionDetailsPresenter {	
	weak var view: ICheckOutSessionDetailsViewController?
	
	init(view: ICheckOutSessionDetailsViewController?) {
		self.view = view
	}
}
