//
//  GalleryPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IGalleryPresenter: class {
	// do someting...
}

class GalleryPresenter: IGalleryPresenter {	
	weak var view: IGalleryViewController?
	
	init(view: IGalleryViewController?) {
		self.view = view
	}
}
