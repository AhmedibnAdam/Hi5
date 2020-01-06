//
//  TransactionsInteractor.swift
//  Hi5
//
//  Created by Adam on 1/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ITransactionsInteractor: class {
	var parameters: [String: Any]? { get set }
}

class TransactionsInteractor: ITransactionsInteractor {
    var presenter: ITransactionsPresenter?
    var manager: ITransactionsManager?
    var parameters: [String: Any]?

    init(presenter: ITransactionsPresenter, manager: ITransactionsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
