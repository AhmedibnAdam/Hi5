//
//  EntrancePresenter.swift
//  Hi5
//
//  Created by Adam on 7/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IEntrancePresenter: class {
	// do someting...
}

class EntrancePresenter: IEntrancePresenter {	
	weak var view: IEntranceViewController?
	
	init(view: IEntranceViewController?) {
		self.view = view
	}
}
