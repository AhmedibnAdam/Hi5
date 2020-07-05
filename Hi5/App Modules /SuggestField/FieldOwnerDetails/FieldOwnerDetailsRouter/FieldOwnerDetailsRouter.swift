//
//  FieldOwnerDetailsRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFieldOwnerDetailsRouter: class {
   
}

class FieldOwnerDetailsRouter: IFieldOwnerDetailsRouter {	
	weak var view: FieldOwnerDetailsViewController?
	
	init(view: FieldOwnerDetailsViewController?) {
		self.view = view
	}
}
