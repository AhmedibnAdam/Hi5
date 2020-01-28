//
//  LibraryInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILibraryInteractor: class {
	var parameters: [String: Any]? { get set }
}

class LibraryInteractor: ILibraryInteractor {
    var presenter: ILibraryPresenter?
    var manager: ILibraryManager?
    var parameters: [String: Any]?

    init(presenter: ILibraryPresenter, manager: ILibraryManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
