//
//  MyEventDetailsPresenter.swift
//  Hi5
//
//  Created by Adam on 7/22/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IMyEventDetailsPresenter: class {
	// do someting...
}

class MyEventDetailsPresenter: IMyEventDetailsPresenter {	
	weak var view: IMyEventDetailsViewController?
	
	init(view: IMyEventDetailsViewController?) {
		self.view = view
	}
}
