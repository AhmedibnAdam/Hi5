//
//  SechadualePresenter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISechadualePresenter: class {
	// do someting...
}

class SechadualePresenter: ISechadualePresenter {	
	weak var view: ISechadualeViewController?
	
	init(view: ISechadualeViewController?) {
		self.view = view
	}
}
