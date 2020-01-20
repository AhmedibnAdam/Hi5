//
//  EditProfilePresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/20/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IEditProfilePresenter: class {
	// do someting...
}

class EditProfilePresenter: IEditProfilePresenter {	
	weak var view: IEditProfileViewController?
	
	init(view: IEditProfileViewController?) {
		self.view = view
	}
}
