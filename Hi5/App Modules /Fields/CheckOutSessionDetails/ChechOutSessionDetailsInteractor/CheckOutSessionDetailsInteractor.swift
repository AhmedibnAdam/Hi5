//
//  CheckOutSessionDetailsInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICheckOutSessionDetailsInteractor: class {
	var parameters: [String: Any]? { get set }
}

class CheckOutSessionDetailsInteractor: ICheckOutSessionDetailsInteractor {
    var presenter: ICheckOutSessionDetailsPresenter?
    var manager: ICheckOutSessionDetailsManager?
    var parameters: [String: Any]?

    init(presenter: ICheckOutSessionDetailsPresenter, manager: ICheckOutSessionDetailsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
