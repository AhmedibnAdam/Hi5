//
//  LocationPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/26/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILocationPresenter: class {
	// do someting...
}

class LocationPresenter: ILocationPresenter {	
	weak var view: ILocationViewController?
	
	init(view: ILocationViewController?) {
		self.view = view
	}
}
