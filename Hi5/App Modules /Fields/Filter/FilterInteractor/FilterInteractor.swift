//
//  FilterInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFilterInteractor: class {
	var parameters: [String: Any]? { get set }
}

class FilterInteractor: IFilterInteractor {
    var presenter: IFilterPresenter?
    var manager: IFilterManager?
    var parameters: [String: Any]?

    init(presenter: IFilterPresenter, manager: IFilterManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
