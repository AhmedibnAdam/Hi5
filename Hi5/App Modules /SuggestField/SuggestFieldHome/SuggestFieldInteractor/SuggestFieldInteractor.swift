//
//  SuggestFieldInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/24/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISuggestFieldInteractor: class {
	var parameters: [String: Any]? { get set }
}

class SuggestFieldInteractor: ISuggestFieldInteractor {
    var presenter: ISuggestFieldPresenter?
    var manager: ISuggestFieldManager?
    var parameters: [String: Any]?

    init(presenter: ISuggestFieldPresenter, manager: ISuggestFieldManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
