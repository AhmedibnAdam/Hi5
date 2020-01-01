//
//  WalletInteractor.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IWalletInteractor: class {
	var parameters: [String: Any]? { get set }
}

class WalletInteractor: IWalletInteractor {
    var presenter: IWalletPresenter?
    var manager: IWalletManager?
    var parameters: [String: Any]?

    init(presenter: IWalletPresenter, manager: IWalletManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
