//
//  DateOfBirthPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/21/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IDateOfBirthPresenter: class {
	// do someting...
}

class DateOfBirthPresenter: IDateOfBirthPresenter {	
	weak var view: IDateOfBirthViewController?
	
	init(view: IDateOfBirthViewController?) {
		self.view = view
	}
}
