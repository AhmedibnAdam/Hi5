//
//  TransactionsRouter.swift
//  Hi5
//
//  Created by Adam on 1/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ITransactionsRouter: class {
	// do someting...
}

class TransactionsRouter: ITransactionsRouter {	
	weak var view: TransactionsViewController?
	
	init(view: TransactionsViewController?) {
		self.view = view
	}
}
