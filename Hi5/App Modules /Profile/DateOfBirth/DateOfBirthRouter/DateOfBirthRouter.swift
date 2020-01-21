//
//  DateOfBirthRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/21/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IDateOfBirthRouter: class {
	// do someting...
}

class DateOfBirthRouter: IDateOfBirthRouter {	
	weak var view: DateOfBirthViewController?
	
	init(view: DateOfBirthViewController?) {
		self.view = view
	}
}
