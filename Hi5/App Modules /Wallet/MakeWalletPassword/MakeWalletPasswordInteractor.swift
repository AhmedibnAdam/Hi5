//
//  MakeWalletPasswordInteractor.swift
//  Hi5
//
//  Created by Adam on 1/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMakeWalletPasswordInteractor: class {
	var parameters: [String: Any]? { get set }
}

class MakeWalletPasswordInteractor: IMakeWalletPasswordInteractor {
    var presenter: IMakeWalletPasswordPresenter?
    var manager: IMakeWalletPasswordManager?
    var parameters: [String: Any]?

    init(presenter: IMakeWalletPasswordPresenter, manager: IMakeWalletPasswordManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
