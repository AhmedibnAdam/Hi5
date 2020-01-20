//
//  EditProfileRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/20/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IEditProfileRouter: class {
	// do someting...
}

class EditProfileRouter: IEditProfileRouter {	
	weak var view: EditProfileViewController?
	
	init(view: EditProfileViewController?) {
		self.view = view
	}
}
