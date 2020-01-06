//
//  BookSessionPresenter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IBookSessionPresenter: class {
	// do someting...
}

class BookSessionPresenter: IBookSessionPresenter {	
	weak var view: IBookSessionViewController?
	
	init(view: IBookSessionViewController?) {
		self.view = view
	}
}
