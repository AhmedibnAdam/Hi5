//
//  SocialPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/11/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISocialPresenter: class {
	// do someting...
}

class SocialPresenter: ISocialPresenter {	
	weak var view: ISocialViewController?
	
	init(view: ISocialViewController?) {
		self.view = view
	}
}
