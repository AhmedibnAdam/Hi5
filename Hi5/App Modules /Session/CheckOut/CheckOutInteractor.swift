//
//  CheckOutInteractor.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICheckOutInteractor: class {
	var parameters: [String: Any]? { get set }
}

class CheckOutInteractor: ICheckOutInteractor {
    var presenter: ICheckOutPresenter?
    var manager: ICheckOutManager?
    var parameters: [String: Any]?

    init(presenter: ICheckOutPresenter, manager: ICheckOutManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
