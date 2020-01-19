//
//  TabBarPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/19/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ITabBarPresenter: class {
	// do someting...
}

class TabBarPresenter: ITabBarPresenter {	
	weak var view: ITabBarViewController?
	
	init(view: ITabBarViewController?) {
		self.view = view
	}
}
