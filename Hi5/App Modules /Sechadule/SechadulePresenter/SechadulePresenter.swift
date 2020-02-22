//
//  SechadulePresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/14/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISechadulePresenter: class {
	// do someting...
}

class SechadulePresenter: ISechadulePresenter {	
	weak var view: ISechaduleViewController?
	
	init(view: ISechaduleViewController?) {
		self.view = view
	}
}
