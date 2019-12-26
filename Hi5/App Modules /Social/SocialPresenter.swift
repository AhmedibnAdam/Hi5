//
//  SocialPresenter.swift
//  Hi5
//
//  Created by Adam on 12/23/19.
//  Copyright (c) 2019 Fudex. All rights reserved.
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
