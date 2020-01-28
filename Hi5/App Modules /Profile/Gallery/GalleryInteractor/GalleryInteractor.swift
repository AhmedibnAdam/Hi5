//
//  GalleryInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IGalleryInteractor: class {
	var parameters: [String: Any]? { get set }
}

class GalleryInteractor: IGalleryInteractor {
    var presenter: IGalleryPresenter?
    var manager: IGalleryManager?
    var parameters: [String: Any]?

    init(presenter: IGalleryPresenter, manager: IGalleryManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
