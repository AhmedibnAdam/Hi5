//
//  ReceiptPresenter.swift
//  Hi5
//
//  Created by Adam on 7/29/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IReceiptPresenter: class {
	// do someting...
}

class ReceiptPresenter: IReceiptPresenter {	
	weak var view: IReceiptViewController?
	
	init(view: IReceiptViewController?) {
		self.view = view
	}
}
