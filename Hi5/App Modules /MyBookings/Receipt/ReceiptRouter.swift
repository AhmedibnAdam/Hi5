//
//  ReceiptRouter.swift
//  Hi5
//
//  Created by Adam on 7/29/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IReceiptRouter: class {
	// do someting...
}

class ReceiptRouter: IReceiptRouter {	
	weak var view: ReceiptViewController?
	
	init(view: ReceiptViewController?) {
		self.view = view
	}
}
