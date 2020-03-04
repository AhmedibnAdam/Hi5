//
//  SessionResultPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/4/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISessionResultPresenter: class {
	// do someting...
}

class SessionResultPresenter: ISessionResultPresenter {	
	weak var view: ISessionResultViewController?
	
	init(view: ISessionResultViewController?) {
		self.view = view
	}
}
