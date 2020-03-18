//
//  MyBookingsInteractor.swift
//  Hi5
//
//  Created by Adam on 3/18/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyBookingsInteractor: class {
	var parameters: [String: Any]? { get set }
}

class MyBookingsInteractor: IMyBookingsInteractor {
    var presenter: IMyBookingsPresenter?
    var manager: IMyBookingsManager?
    var parameters: [String: Any]?

    init(presenter: IMyBookingsPresenter, manager: IMyBookingsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
