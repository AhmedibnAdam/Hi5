//
//  SettingPresenter.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISettingPresenter: class {
	// do someting...
}

class SettingPresenter: ISettingPresenter {	
	weak var view: ISettingViewController?
	
	init(view: ISettingViewController?) {
		self.view = view
	}
}
