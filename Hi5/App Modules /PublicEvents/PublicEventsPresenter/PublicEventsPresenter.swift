//
//  PublicEventsPresenter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IPublicEventsPresenter: class {
	// do someting...
}

class PublicEventsPresenter: IPublicEventsPresenter {	
	weak var view: IPublicEventsViewController?
	
	init(view: IPublicEventsViewController?) {
		self.view = view
	}
}
