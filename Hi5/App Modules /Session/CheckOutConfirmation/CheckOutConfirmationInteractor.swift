//
//  CheckOutConfirmationInteractor.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICheckOutConfirmationInteractor: class {
	var parameters: [String: Any]? { get set }
}

class CheckOutConfirmationInteractor: ICheckOutConfirmationInteractor {
    var presenter: ICheckOutConfirmationPresenter?
    var manager: ICheckOutConfirmationManager?
    var parameters: [String: Any]?

    init(presenter: ICheckOutConfirmationPresenter, manager: ICheckOutConfirmationManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
