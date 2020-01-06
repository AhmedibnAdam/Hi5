//
//  AddFundInteractor.swift
//  Hi5
//
//  Created by Adam on 1/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAddFundInteractor: class {
	var parameters: [String: Any]? { get set }
}

class AddFundInteractor: IAddFundInteractor {
    var presenter: IAddFundPresenter?
    var manager: IAddFundManager?
    var parameters: [String: Any]?

    init(presenter: IAddFundPresenter, manager: IAddFundManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
